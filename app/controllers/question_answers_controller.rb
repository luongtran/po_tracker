class QuestionAnswersController < ApplicationController
  before_filter :load_question
  
  def create
    logger = Logger.new('log/question_answer.log')
    logger.info("=========Log for Question Answer==========")
    number_answers = params[:number_answer]
    @question_answers = []
    i = 1
    params[:answers].each do |answer|
      if(!answer.empty? && !answer.nil?)
        @question_answers << @question.question_answers.new({:answer => answer, :position => i})
        i += 1
      end 
    end
    logger.info(@question_answers)
    QuestionAnswer.import @question_answers
    @question_answers = @question.question_answers.orders
    logger.info(@question_answers)
    
  end
  
  def update
    @question_answer = QuestionAnswer.find(params[:id])
    if @question_answer.update_attributes!({:answer => params[:answer]})
      @success = true
    else
      @success = false
    end
    
    render :json => {:success => @success}
    
  end
  
  def destroy
    @question_answer = QuestionAnswer.find(params[:id])
    if @question_answer.destroy
      @success = true
    else 
      @success = false
    end
    
    render :json => {:success => @success }
    
  end
  
  private
  def load_question
    @question = Question.find(params[:question_id])
  end
  
end
