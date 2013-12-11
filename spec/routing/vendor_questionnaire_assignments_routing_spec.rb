require "spec_helper"

describe VendorQuestionnaireAssignmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/vendor_questionnaire_assignments").should route_to("vendor_questionnaire_assignments#index")
    end

    it "routes to #new" do
      get("/vendor_questionnaire_assignments/new").should route_to("vendor_questionnaire_assignments#new")
    end

    it "routes to #show" do
      get("/vendor_questionnaire_assignments/1").should route_to("vendor_questionnaire_assignments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vendor_questionnaire_assignments/1/edit").should route_to("vendor_questionnaire_assignments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vendor_questionnaire_assignments").should route_to("vendor_questionnaire_assignments#create")
    end

    it "routes to #update" do
      put("/vendor_questionnaire_assignments/1").should route_to("vendor_questionnaire_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vendor_questionnaire_assignments/1").should route_to("vendor_questionnaire_assignments#destroy", :id => "1")
    end

  end
end
