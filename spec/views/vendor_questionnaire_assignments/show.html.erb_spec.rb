require 'spec_helper'

describe "vendor_questionnaire_assignments/show.html.erb" do
  before(:each) do
    @vendor_questionnaire_assignment = assign(:vendor_questionnaire_assignment, stub_model(VendorQuestionnaireAssignment,
      :employee_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
