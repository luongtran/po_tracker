class QuestionnaireGroupsController < ApplicationController
  # GET /questionnaire_groups
  # GET /questionnaire_groups.json
  def index
    @questionnaire_groups = QuestionnaireGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionnaire_groups }
    end
  end

  # GET /questionnaire_groups/1
  # GET /questionnaire_groups/1.json
  def show
    @questionnaire_group = QuestionnaireGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionnaire_group }
    end
  end

  # GET /questionnaire_groups/new
  # GET /questionnaire_groups/new.json
  def new
    @questionnaire_group = QuestionnaireGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questionnaire_group }
    end
  end

  # GET /questionnaire_groups/1/edit
  def edit
    @questionnaire_group = QuestionnaireGroup.find(params[:id])
  end

  # POST /questionnaire_groups
  # POST /questionnaire_groups.json
  def create
    @questionnaire_group = QuestionnaireGroup.new(params[:questionnaire_group])

    respond_to do |format|
      if @questionnaire_group.save
        format.html { redirect_to @questionnaire_group, notice: 'Questionnaire group was successfully created.' }
        format.json { render json: @questionnaire_group, status: :created, location: @questionnaire_group }
      else
        format.html { render action: "new" }
        format.json { render json: @questionnaire_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questionnaire_groups/1
  # PUT /questionnaire_groups/1.json
  def update
    @questionnaire_group = QuestionnaireGroup.find(params[:id])

    respond_to do |format|
      if @questionnaire_group.update_attributes(params[:questionnaire_group])
        format.html { redirect_to @questionnaire_group, notice: 'Questionnaire group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionnaire_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaire_groups/1
  # DELETE /questionnaire_groups/1.json
  def destroy
    @questionnaire_group = QuestionnaireGroup.find(params[:id])
    @questionnaire_group.destroy

    respond_to do |format|
      format.html { redirect_to questionnaire_groups_url }
      format.json { head :no_content }
    end
  end
end
