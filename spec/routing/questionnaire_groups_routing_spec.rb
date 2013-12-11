require "spec_helper"

describe QuestionnaireGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/questionnaire_groups").should route_to("questionnaire_groups#index")
    end

    it "routes to #new" do
      get("/questionnaire_groups/new").should route_to("questionnaire_groups#new")
    end

    it "routes to #show" do
      get("/questionnaire_groups/1").should route_to("questionnaire_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/questionnaire_groups/1/edit").should route_to("questionnaire_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/questionnaire_groups").should route_to("questionnaire_groups#create")
    end

    it "routes to #update" do
      put("/questionnaire_groups/1").should route_to("questionnaire_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/questionnaire_groups/1").should route_to("questionnaire_groups#destroy", :id => "1")
    end

  end
end
