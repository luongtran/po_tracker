class QuestionsController < ApplicationController
  
  def index
    @questions = Question.list(params, :order => "questions.question")
  end
  
  def show
    @question = Question.find(params[:id])
  end
  
  def new
    @question = Question.new
    @question_types = Question::TYPES_ARR
  end
  
  def create
    @question = Question.new(params[:question])
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was created successfully.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render :action => "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def search
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
