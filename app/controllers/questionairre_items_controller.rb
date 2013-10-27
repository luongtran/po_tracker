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
    @questionairre_item = QuestionairreItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionairre_item }
    end
  end

  # GET /questionairre_items/new
  # GET /questionairre_items/new.json
  def new
    @questionairre_item = QuestionairreItem.new

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
        format.html { redirect_to @questionairre_item, notice: 'Questionairre item was successfully created.' }
        format.json { render json: @questionairre_item, status: :created, location: @questionairre_item }
      else
        format.html { render action: "new" }
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
end
