require "spec_helper"

describe VendorQuestionnaireGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/vendor_questionnaire_groups").should route_to("vendor_questionnaire_groups#index")
    end

    it "routes to #new" do
      get("/vendor_questionnaire_groups/new").should route_to("vendor_questionnaire_groups#new")
    end

    it "routes to #show" do
      get("/vendor_questionnaire_groups/1").should route_to("vendor_questionnaire_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vendor_questionnaire_groups/1/edit").should route_to("vendor_questionnaire_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vendor_questionnaire_groups").should route_to("vendor_questionnaire_groups#create")
    end

    it "routes to #update" do
      put("/vendor_questionnaire_groups/1").should route_to("vendor_questionnaire_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vendor_questionnaire_groups/1").should route_to("vendor_questionnaire_groups#destroy", :id => "1")
    end

  end
end
