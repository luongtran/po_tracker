class QuestionnaireWorkflowsController < ApplicationController
  
  before_filter :load_vendor_questionnaire, :except => [:init_questionnaire, :send_questionnaire]
  before_filter :get_signatures, :except => [:init_questionnaire, :send_questionnaire]
  before_filter :remove_existed_vendor_answer, :only => [:vendor_answer]

  def init_questionnaire
    logger = Logger.new('log/questionnaire.log')
    logger.info("========Log for init questionnaire=========")
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire_groups = @questionnaire.questionnaire_groups.includes(:questionnaires_questions).includes(:questions)
    @vendors = Vendor.all
    @employees = Employee.all
    @vendor_questionnaire = VendorQuestionnaire.new    
  end
  
  def show   
    @user = current_employee
    @employees = Employee.all
  end
  
  # step 1: Choose questionnaire to send to vendor
  # Choose employee approver for each Questionnaire group.
  def send_questionnaire
    @user = current_employee
    success = false
    @vendor_questionnaire = VendorQuestionnaire.new(params[:vendor_questionnaire])
    @vendor_questionnaire.employee_id = @user.id
    if @vendor_questionnaire.save
      params[:approver_id].each do |f|
        @vendor_questionnaire.vendor_questionnaire_groups.new({questionnaire_group_id: f[0],approver_id: f[1]}).save #f[0] questionnaire_group_id f[1] employee_id        
      end
      success = true
    else
      success = false
    end    
    respond_to do |format|
      if success
        format.html { redirect_to show_question_path(@vendor_questionnaire), notice: 'Sent questionnaire successfully.' }
        format.json { render json: @vendor_questionnaire, status: :created, location: show_question_path(@vendor_questionnaire) }        
      else
        format.html { render :action => "init_questionnaire_workflow" }
        format.json { render json: @vendor_questionnaire.errors, status: :unprocessable_entity }
      end
   end
  end
  
  # Step 2: Vendor answer questionnaire 
  # Comment line is for vendor sign_in future function
  def vendor_view
    @user = current_employee
#    @vendor = curren_vendor                                   # current vendor sign_in
#    if @vendor.access_key == @vendor_questionnaire.access_key
      @action_url = vendor_answer_path(@vendor_questionnaire)
      @vendor_answer = @vendor_questionnaire.vendor_answer
      @vendor_signatures = @vendor_questionnaire.signatures.first
#    else
#      flash[:error] = "You are not authorized to access this page."
#      redirect_to main_menu_path and return false
#    end
  end
  
  def vendor_answer
    vendor_questionnaire_answers = []
    i = 0
    @vendor_questionnaire_groups.each do |group|
      questions = group.questions
      questions.each do |q|
        question = q
        if question.question_type == Question::TYPES[:multiple]
        params["question_answer_ids_#{q.id}"].each do |a|
          
          vendor_questionnaire_answer = VendorQuestionnaireAnswer.new({:question_id => question.id, :question_answer_id => a, 
                                            :vendor_questionnaire_id => @vendor_questionnaire.id })
          vendor_questionnaire_answer.vendor_id = 1 # @vendor.id if vendor login
          vendor_questionnaire_answers << vendor_questionnaire_answer
        end
      else
       
        vendor_questionnaire_answer = VendorQuestionnaireAnswer.new(params["vendor_questionnaire_answers_#{i}"])
        vendor_questionnaire_answer.question_id = question.id
        vendor_questionnaire_answer.vendor_id = 1 # @vendor.id if vendor login
        vendor_questionnaire_answer.vendor_questionnaire_id = @vendor_questionnaire.id
        
        vendor_questionnaire_answers << vendor_questionnaire_answer
      end     
      i += 1
      end
    end
    VendorQuestionnaireAnswer.import vendor_questionnaire_answers               #Save multi record (activerecord-import gem)
    if @vendor_questionnaire.signatures.length == 0 && !params["vendor_signature_#{@vendor_questionnaire.id}"].nil? && !params["vendor_signature_#{@vendor_questionnaire.id}"].empty? #&& @vendor_questionnaire.approval_status.nil?
      @vendor_signatures = @vendor_questionnaire.signatures.create!({:sign => params["vendor_signature_#{@vendor_questionnaire.id}"], :text => "Vendor signature"})
      RequestMailer.requests_for_approver(@vendor_questionnaire).deliver
    elsif !params["vendor_signature_#{@vendor_questionnaire.id}"].nil? && !params["vendor_signature_#{@vendor_questionnaire.id}"].empty?
      RequestMailer.answer_updated(@vendor_questionnaire).deliver
      @vendor_signatures = @vendor_questionnaire.signatures.first
      @vendor_signatures.update_attributes({:sign => params["vendor_signature_#{@vendor_questionnaire.id}"], :text => "Vendor signature"})
    end
    @vendor_questionnaire.vendor_answer = false #Signed(can't sign again)
    @vendor_questionnaire.save!
    load_vendor_questionnaire
    @action_url = ""
    @vendor_signatures = @vendor_questionnaire.signatures.first
    @vendor_answer = false
    flash.now[:notice] = "Your Vendor – Questionnaire has been answer, please wait for approval!"
    render action: "vendor_view"
  end
  
  def approval_view
    @user = current_employee
    @unsigned = false
    @active_group = @vendor_questionnaire_groups.where(approver_id: @user.id)
    if @active_group.length > 0
      @approver_view = true
      @active_group.each do |group|
        if group.signature.nil? || group.vendor_questionnaire_approvals.last.approval_status == "rejected"
          @unsigned = true
        end
      end
    else
      @approver_view = false
    end
    @action_url = approval_path(@vendor_questionnaire)
    @vendor_answer = @vendor_questionnaire.vendor_answer
    if (@user.id == @vendor_questionnaire.employee_id) || @approver_view
      respond_to do |format|
        format.html
      end
    else
      flash[:error] = "You are not authorized to access this page."
      redirect_to main_menu_path and return false
    end
  end
  
  def approval
    @user = current_employee
    @active_groups = @vendor_questionnaire_groups.where(approver_id: @user.id)
    if params[:status]
      save_approval
      render "approval_view"
    end
  end
  
  def application_approved
    if @vendor_questionnaire.approval_step == 11 && @questionnaire.completed_at != nil
      respond_to do |format|
        format.html
      end
    else
      flash.now[:notice] = "Your VENDOR – APPLICATION is not completed yet !"
      redirect_to action: "procurement_coordinator",id: params[:id]
    end    
  end
  
  private
  
  def remove_existed_vendor_answer
    @vendor_questionnaire.vendor_questionnaire_answers.each do |a|
      a.destroy
    end
  end
  
  def save_approval
    logger = Logger.new("log/save_approval.log")
    logger.info("---------- Logger for save approval ---------")
    @active_groups.each do |group|
      if get_existed_signature(group).nil?
        create_signature(group)
      else
        update_signature(group)
      end
      @vendor_questionnaire_approval = VendorQuestionnaireApproval.new({:approval_status => params[:status],:approver => current_employee.id,
                                          :comment => params[:conversation],:signature_id => @signature.id,:vendor_questionnaire_group_id => group.id})
        result = @vendor_questionnaire_approval.save!
      if (result && params[:status] == "approved")
        group.questions.each do |question|
          question_approval_status = group.questions_approval_status(question.id)
          question_approval_status.update_attributes(approval_status: (params["question_approver_status_#{question.id}"].present? ? params["question_approver_status_#{question.id}"]["answer_approval"] : params[:status]))
          logger.info("STATUS #{params["question_approver_status_#{question.id}"].present? ? params["question_approver_status_#{question.id}"]["answer_approval"] : params[:status]}")
        end
      else
        @vendor_questionnaire.update_attributes(:vendor_answer => true)
        group.questions.each do |question|
          question_approval_status = group.questions_approval_status(question.id)
          question_approval_status.update_attributes(approval_status: (params["question_approver_status_#{question.id}"].present? ? params["question_approver_status_#{question.id}"]["answer_approval"] : params[:status]))
        end
        RequestMailer.questionnaire_rejected(@vendor_questionnaire).deliver
      end
    end
  end
  
  def update_signature(group)
    signature = group.signature
    if !signature.nil?
      signature.update_attributes!({:sign => params["approver_signature_#{@vendor_questionnaire.id}"]})
    end
  end 
  
  def get_existed_signature(group_id)
    @signature = Signature.find(:first,:conditions => {:vendor_questionnaire_group_id => group_id})
  end
  
  def create_signature(group)    
    @signature = Signature.create!({:text => "Approval signature", :sign => params["approver_signature_#{@vendor_questionnaire.id}"],:vendor_questionnaire_group_id => group.id})
    return @signature    
  end
  
  def get_signatures
    @vendor_signatures = @vendor_questionnaire.signatures.first
  end
  
  def load_vendor_questionnaire
    @vendor_questionnaire = VendorQuestionnaire.includes(:questionnaire, :vendor).find(params[:id])
    @questionnaire = @vendor_questionnaire.questionnaire
    @vendor_questionnaire_groups = @vendor_questionnaire.vendor_questionnaire_groups.includes(:questionnaire_group)
  end
end
