require 'spec_helper'

describe "vendor_questionnaire_groups/index.html.erb" do
  before(:each) do
    assign(:vendor_questionnaire_groups, [
      stub_model(VendorQuestionnaireGroup,
        :approval_status => "Approval Status",
        :string, => "String,",
        :questionnaire_group_id => 1
      ),
      stub_model(VendorQuestionnaireGroup,
        :approval_status => "Approval Status",
        :string, => "String,",
        :questionnaire_group_id => 1
      )
    ])
  end

  it "renders a list of vendor_questionnaire_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Approval Status".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "String,".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
