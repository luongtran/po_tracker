require 'spec_helper'

describe "questionnaire_groups/new.html.erb" do
  before(:each) do
    assign(:questionnaire_group, stub_model(QuestionnaireGroup,
      :questionnaire_id => 1,
      :approver_id => 1
    ).as_new_record)
  end

  it "renders new questionnaire_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => questionnaire_groups_path, :method => "post" do
      assert_select "input#questionnaire_group_questionnaire_id", :name => "questionnaire_group[questionnaire_id]"
      assert_select "input#questionnaire_group_approver_id", :name => "questionnaire_group[approver_id]"
    end
  end
end
