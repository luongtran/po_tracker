class QuestionnairesController < ApplicationController
  
  def index
    
  end
  
  def show
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire_questions = @questionnaire.questionnaires_questions
  end
  
  def new
    @questionnaire = Questionnaire.new
    @questions = Question.includes(:question_answers).active_questions
  end
  
  def create
    logger = Logger.new('log/create_questionnaire_log')
    logger.info("=========== Log for create questionnaire ==========")
    @questionnaire = Questionnaire.new(params[:questionnaire])
    logger.info(params[:questionnaire])
    if @questionnaire.save!
      questionnaire_questions = []
      logger.info(questionnaire_questions)
      questions = params[:question_ids].split(',')
      questions.each do |q|
        questionnaire_questions << QuestionnairesQuestion.new({:question_id => q, :questionnaire_id => @questionnaire.id})
      end
      QuestionnairesQuestion.import questionnaire_questions
      @success = true
      @questionnaire_questions = QuestionnairesQuestion.includes(:question).where("questionnaire_id = ?", @questionnaire.id)
    else
      @success = false
    end
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
