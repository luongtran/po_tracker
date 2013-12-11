require 'spec_helper'

describe "vendor_questionnaire_assignments/index.html.erb" do
  before(:each) do
    assign(:vendor_questionnaire_assignments, [
      stub_model(VendorQuestionnaireAssignment,
        :employee_id => ""
      ),
      stub_model(VendorQuestionnaireAssignment,
        :employee_id => ""
      )
    ])
  end

  it "renders a list of vendor_questionnaire_assignments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
