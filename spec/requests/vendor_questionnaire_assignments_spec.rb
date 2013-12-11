require 'spec_helper'

describe "VendorQuestionnaireAssignments" do
  describe "GET /vendor_questionnaire_assignments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vendor_questionnaire_assignments_path
      response.status.should be(200)
    end
  end
end
