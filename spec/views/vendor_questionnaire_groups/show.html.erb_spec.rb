require 'spec_helper'

describe "vendor_questionnaire_groups/show.html.erb" do
  before(:each) do
    @vendor_questionnaire_group = assign(:vendor_questionnaire_group, stub_model(VendorQuestionnaireGroup,
      :approval_status => "Approval Status",
      :string, => "String,",
      :questionnaire_group_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Approval Status/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/String,/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
