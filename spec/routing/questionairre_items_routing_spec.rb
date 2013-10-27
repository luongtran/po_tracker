require "spec_helper"

describe QuestionairreItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/questionairre_items").should route_to("questionairre_items#index")
    end

    it "routes to #new" do
      get("/questionairre_items/new").should route_to("questionairre_items#new")
    end

    it "routes to #show" do
      get("/questionairre_items/1").should route_to("questionairre_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/questionairre_items/1/edit").should route_to("questionairre_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/questionairre_items").should route_to("questionairre_items#create")
    end

    it "routes to #update" do
      put("/questionairre_items/1").should route_to("questionairre_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/questionairre_items/1").should route_to("questionairre_items#destroy", :id => "1")
    end

  end
end
