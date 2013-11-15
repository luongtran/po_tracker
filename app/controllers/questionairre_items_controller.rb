class QuestionairreItemsController < ApplicationController
  # GET /questionairre_items
  # GET /questionairre_items.json
  def index
    @questionairre_items = QuestionairreItem.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionairre_items }
    end
  end

  # GET /questionairre_items/1
  # GET /questionairre_items/1.json
  def show
    @questionairre_item = QuestionairreItem.includes(:questionairre_answers).find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionairre_item }
    end
  end

  # GET /questionairre_items/new
  # GET /questionairre_items/new.json
  def new
    @questionairre_item = QuestionairreItem.new
    @types = QuestionairreItem::TYPES
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questionairre_item }
    end
  end

  # GET /questionairre_items/1/edit
  def edit
    @questionairre_item = QuestionairreItem.find(params[:id])
    
  end

  # POST /questionairre_items
  # POST /questionairre_items.json
  def create
    @questionairre_item = QuestionairreItem.new(params[:questionairre_item])
    respond_to do |format|
      if @questionairre_item.save
        ## To step 2
        #format.html {
        #  render :partial => "step2",
        #         :layout => false,
        #         :locals => { :questionairre_item => @questionairre_item}
        #}
        format.html { redirect_to @questionairre_item, notice: 'Questionairre item was successfully created.' }
        format.json { render json: @questionairre_item, status: :created, location: @questionairre_item }
      else
        @types = QuestionairreItem::TYPES
        format.html { render :action => "new" }
        format.json { render json: @questionairre_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questionairre_items/1
  # PUT /questionairre_items/1.json
  def update
    @questionairre_item = QuestionairreItem.find(params[:id])

    respond_to do |format|
      if @questionairre_item.update_attributes(params[:questionairre_item])
        format.html { redirect_to @questionairre_item, notice: 'Questionairre item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionairre_item.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /questionairre_items/1
  # DELETE /questionairre_items/1.json
  def destroy
    @questionairre_item = QuestionairreItem.find(params[:id])
    @questionairre_item.destroy

    respond_to do |format|
      format.html { redirect_to questionairre_items_url }
      format.json { head :no_content }
    end
  end

  def save_answer
    
    question_id = params[:question][:id]
    question = QuestionairreItem.includes(:questionairre_answers).find(params[:question][:id])
    params[:question].delete(:id)
    question.update_attributes params[:question]
    if ['text', 'yes_or_no'].include?(question.question_type)
      if question.questionairre_answers.empty?
        question.questionairre_answers.create(params[:answer])
      else
        #FIXME check id match
        answer = QuestionairreAnswer.find(params[:answer][:id])
        answer.update_attributes(params[:answer])
      end
    else
      answers = params[:answers].values
      #FIXME,validate only one of answers is true
      answers.each do |a|
        if a.has_key?('id')
          answer = QuestionairreAnswer.find(a[:id])
          if answer
            answer.update_attributes a
          end
        else
          question.questionairre_answers.create(a)
        end
      end 
    end
    #reload eager
    @question = QuestionairreItem.includes(:questionairre_answers).find(question_id)
    response = {}
    response['success'] = true
    response[:html] = render_to_string(:partial => "questionairre_items/types/#{@question.question_type}", :locals => {:questionairre_item => @question}).html_safe
    render :json => response.to_json()
  end
  
  def delete_answer
    response = {}
    response['success'] = true
    begin
      question = QuestionairreItem.includes(:questionairre_answers).find(params[:question_id])
      answer = question.questionairre_answers.find(params[:answer_id])
      if(question.questionairre_answers.count > 2) #ensure
        answer.destroy 
      else
        response['success'] = false
        response['message'] = 'Can\'t delete this answer. Number of answers must be at least 2.'
      end
    rescue ActiveRecord::RecordNotFound => e
      response['success'] = false
    ensure
      render :json => response.to_json()
    end

  end
end
