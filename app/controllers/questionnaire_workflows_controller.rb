class QuestionnaireWorkflowsController < ApplicationController
  
  before_filter :load_vendor_questionnaire, :except => [:init_questionnaire_workflow, :send_questionnaire]
  before_filter :get_signatures, :except => [:init_questionnaire_workflow, :send_questionnaire]
  before_filter :remove_existed_vendor_answer, :only => [:vendor_answer]
  
  def init_questionnaire_workflow
    logger = Logger.new('log/questionnaire_workflow.log')
    logger.info("========Log for init questionnaire=========")
    @questionnaire = Questionnaire.includes(:questions).find(params[:id])
    logger.info(@questionnaire)
    @vendors = Vendor.all
    @vendor_questionnaire = VendorQuestionnaire.new
    @questionnaire_questions = @questionnaire.questionnaires_questions
  end
  
  def show
    
  end
  
  # step 1: Choose questionnaire to send to vendor
  def send_questionnaire
    @vendor_questionnaire = VendorQuestionnaire.new(params[:vendor_questionnaire])
    @vendor_questionnaire.approval_step = 2
    respond_to do |format|
      if @vendor_questionnaire.save
        format.html { redirect_to show_question_path(@vendor_questionnaire), notice: 'Sent questionnaire successfully.' }
        format.json { render json: @vendor_questionnaire, status: :created, location: show_question_path(@vendor_questionnaire) }
      else
        format.html { render :action => "init_questionnaire_workflow" }
        format.json { render json: @vendor_questionnaire.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
  # Step 2: Vendor answer questionnaire 
  
  def vendor_view
    @action_url = vendor_answer_path(@vendor_questionnaire)
    
    render "show"
  end
  
  def vendor_answer
    vendor_questionnaire_answers = []
    i = 0
    
    @questionnaire_questions.each do |q|
      question = q.question
      
      if question.question_type == Question::TYPES[:multiple]
        params["question_answer_ids_#{q.id}"].each do |a|
          
          vendor_questionnaire_answer = VendorQuestionnaireAnswer.new({:question_id => question.id, :question_answer_id => a, 
                                            :vendor_questionnaire_id => @vendor_questionnaire.id })
          vendor_questionnaire_answer.vendor_id = 1
          
          vendor_questionnaire_answers << vendor_questionnaire_answer
        end
      else
       
        vendor_questionnaire_answer = VendorQuestionnaireAnswer.new(params["vendor_questionnaire_answers_#{i}"])
        vendor_questionnaire_answer.question_id = question.id
        vendor_questionnaire_answer.vendor_id = 1
        vendor_questionnaire_answer.vendor_questionnaire_id = @vendor_questionnaire.id
        
        vendor_questionnaire_answers << vendor_questionnaire_answer
      end     
    end
    
    VendorQuestionnaireAnswer.import vendor_questionnaire_answers
    
    if !params["vendor_signature_#{@vendor_questionnaire.approval_step}"].nil? && !params["vendor_signature_#{@vendor_questionnaire.approval_step}"].empty? && @vendor_questionnaire.approval_status.nil?
      @vendor_sign = @vendor_questionnaire.signatures.create!({:sign => params["vendor_signature_#{@vendor_questionnaire.approval_step}"], :text => "Vendor signature"})
    end
    
    @vendor_questionnaire.approval_step = 3
    @vendor_questionnaire.save!
    
    @action_url = ""
    render "show"
  end
  
  def first_approval_view
    @action_url = first_approval_path(@vendor_questionnaire)
    render "show"
  end
  
  def first_approval
    status = params[:status]
    if @vendor_questionnaire.approval_step == 3
      save_approval
    end
    render "show"
  end
  
  def qa_approval
    if @vendor_questionnaire.approval_step == 4
      if params[:status]
        save_approval
      end
    end
    render "show"
  end
  
  def procurement_approval
    if @vendor_questionnaire.approval_step == 5
      if params[:status]
        save_approval
      end
    end
    @action_url = procurement_approval_path(@vendor_questionnaire)
    render "show"
  end
  
  def qc_approval
    if @vendor_questionnaire.approval_step == 6
      if params[:status]
        save_approval
      end
    end
    @action_url = qc_approval_path(@vendor_questionnaire)
    render "show"
  end
  
  def buyer_approval_step7
    if @vendor_questionnaire.approval_step == 7
      if params[:status]
        save_approval
      end
    end
    @action_url = buyer_approval_step7_path(@vendor_questionnaire)
    render "show"
  end
  
  def hse_approval
    if @vendor_questionnaire.approval_step == 8
      if params[:status]
        save_approval
      end
    end
    @action_url = hse_approval_path(@vendor_questionnaire)
    render "show"
  end
  
  def buyer_approval_step9
    if @vendor_questionnaire.approval_step == 9
      if params[:status]
        save_approval
      end
    end
    @action_url = buyer_approval_step9_path(@vendor_questionnaire)
    render "show"
  end
  
  def procurement_manager_approval
    if @vendor_questionnaire.approval_step == 10
      if params[:status]
        save_approval
      end
    end
    @action_url = procurement_manager_approval_path(@vendor_questionnaire)
    render "show"
  end
  
  def procurement_coordinator
    if @vendor_questionnaire.approval_step == 11
      if params[:status]
        save_approval
      end
    end
    @action_url = procurement_coordinator_path(@vendor_questionnaire)
    render "show"
  end
  
  private
  
  def remove_existed_vendor_answer
    @vendor_questionnaire.vendor_questionnaire_answers.each do |a|
      a.destroy
    end
  end
  
  def save_approval
    result = false
    if get_existed_approval.nil?
      create_signature
      @vendor_questionnaire_approval = @vendor_questionnaire.vendor_questionnaire_approvals.new({:approval_status => params[:status], 
                                          :comment => params[:conversation], :signature_id => @signature.id, :approval_step => @vendor_questionnaire.approval_step})
      result = @vendor_questionnaire_approval.save!
    else
      update_signature
      result = @vendor_questionnaire_approval.update_attributes!({:approval_status => params[:status], :comment => params[:conversation]})
    end
    
    if (result && status == "approved")
        @vendor_questionnaire.approval_step += 1
        @vendor_questionnaire.approval_status = "approved"
    else
      @vendor_questionnaire.approval_status = "rejected"
    end
    @vendor_questionnaire.save!
  end
  
  def update_signature
    signature = @vendor_questionnaire_approval.signature
    if !signature.nil?
      signature.update_attributes!({:sign => params["vendor_signature_#{@vendor_questionnaire.approval_step}"]})
    end
  end 
  
  def get_existed_approval
    @vendor_questionnaire_approval = VendorQuestionnaireApproval.find(:first, 
                        :conditions => {:vendor_questionnaire_id => @vendor_questionnaire.id, :approval_step => @vendor_questionnaire.approval_step})
  end
  
  def create_signature
    @signature = @vendor_questionnaire.signatures.create!({:text => "Approval signature", :sign => params["vendor_signature_#{@vendor_questionnaire.approval_step}"]})
  end
  
  def get_signatures
    @signatures = @vendor_questionnaire.signatures
  end
  
  def load_vendor_questionnaire
    @vendor_questionnaire = VendorQuestionnaire.includes(:questionnaire, :vendor, :vendor_questionnaire_approvals).find(params[:id])
    @questionnaire = @vendor_questionnaire.questionnaire
    @questionnaire_questions = @questionnaire.questionnaires_questions.includes(:question)
  end
  
end
