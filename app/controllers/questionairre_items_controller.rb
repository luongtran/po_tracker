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
    question = QuestionairreItem.includes(:questionairre_answers).find(params[:questionairre_answer][:questionairre_item_id])

    if ['text', 'yes_or_no'].include?(question.question_type)
      if question.questionairre_answers.empty?
        QuestionairreAnswer.create(params[:questionairre_answer])
      else
        # check id match
        answer = QuestionairreAnswer.find(params[:questionairre_answer][:id])
        answer.update_attributes(params[:questionairre_answer])
      end
    else
      if question.question_type == 'single_choice'

      else   # type = multi_choice

      end

    end
    #FIXME
    render :nothing => true
  end

end
