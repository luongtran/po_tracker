class VendorQuestionnaireGroupsController < ApplicationController
  # GET /vendor_questionnaire_groups
  # GET /vendor_questionnaire_groups.json
  def index
    @vendor_questionnaire_groups = VendorQuestionnaireGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vendor_questionnaire_groups }
    end
  end

  # GET /vendor_questionnaire_groups/1
  # GET /vendor_questionnaire_groups/1.json
  def show
    @vendor_questionnaire_group = VendorQuestionnaireGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vendor_questionnaire_group }
    end
  end

  # GET /vendor_questionnaire_groups/new
  # GET /vendor_questionnaire_groups/new.json
  def new
    @vendor_questionnaire_group = VendorQuestionnaireGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vendor_questionnaire_group }
    end
  end

  # GET /vendor_questionnaire_groups/1/edit
  def edit
    @vendor_questionnaire_group = VendorQuestionnaireGroup.find(params[:id])
  end

  # POST /vendor_questionnaire_groups
  # POST /vendor_questionnaire_groups.json
  def create
    @vendor_questionnaire_group = VendorQuestionnaireGroup.new(params[:vendor_questionnaire_group])

    respond_to do |format|
      if @vendor_questionnaire_group.save
        format.html { redirect_to @vendor_questionnaire_group, notice: 'Vendor questionnaire group was successfully created.' }
        format.json { render json: @vendor_questionnaire_group, status: :created, location: @vendor_questionnaire_group }
      else
        format.html { render action: "new" }
        format.json { render json: @vendor_questionnaire_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vendor_questionnaire_groups/1
  # PUT /vendor_questionnaire_groups/1.json
  def update
    @vendor_questionnaire_group = VendorQuestionnaireGroup.find(params[:id])

    respond_to do |format|
      if @vendor_questionnaire_group.update_attributes(params[:vendor_questionnaire_group])
        format.html { redirect_to @vendor_questionnaire_group, notice: 'Vendor questionnaire group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vendor_questionnaire_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_questionnaire_groups/1
  # DELETE /vendor_questionnaire_groups/1.json
  def destroy
    @vendor_questionnaire_group = VendorQuestionnaireGroup.find(params[:id])
    @vendor_questionnaire_group.destroy

    respond_to do |format|
      format.html { redirect_to vendor_questionnaire_groups_url }
      format.json { head :no_content }
    end
  end
end
