class QuestionnairesController < ApplicationController
  respond_to :json
  def index
    @questionnaires = Questionnaire.list(params, :order => "questionnaires.description")
  end
  
  def show
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire_groups = @questionnaire.questionnaire_groups.includes(:questionnaires_questions).includes(:questions)
  end
  
  def new
    @questionnaire = Questionnaire.new
    @questions = Question.includes(:question_answers).active_questions
  end
  
  def create
    require 'json'
    logger = Logger.new('log/create_questionnaire_log')
    logger.info("=========== Log for create questionnaire ==========")
    data = JSON.parse(params[:questionnaire])
    params[:new] = {}
    params[:new][:title] = data[0]["title"]
    params[:new][:description] = data[0]["description"]
    @questionnaire = Questionnaire.new(params[:new])    
    #require 'debugger';debugger
    if @questionnaire.save!
      data.each do |data|
        next if data["groups"].nil?
        @questionnaire_group = QuestionnaireGroup.new(questionnaire_id: @questionnaire.id)
        @questionnaire_group.save
        question_ids = data["groups"]["question"] # Array ["1","2","4"]
        question_ids.each do |q|
          next if q == ""
          QuestionnairesQuestion.new({:question_id => q, :questionnaire_group_id => @questionnaire_group.id}).save
        end
      end     
       @success = true
    else
      @success = false
    end   
    
    respond_to do |format|
      if @success
        if request.xhr?
          format.json { render json: { success: @success, url: questionnaire_path(@questionnaire)} }
        else
          format.html { redirect_to @questionnaire, notice: 'Questionnaire was created successfully.' }
        end
      else
        format.html { render :action => "new" }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
