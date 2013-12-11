require 'spec_helper'

describe "questionnaire_groups/index.html.erb" do
  before(:each) do
    assign(:questionnaire_groups, [
      stub_model(QuestionnaireGroup,
        :questionnaire_id => 1,
        :approver_id => 1
      ),
      stub_model(QuestionnaireGroup,
        :questionnaire_id => 1,
        :approver_id => 1
      )
    ])
  end

  it "renders a list of questionnaire_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
