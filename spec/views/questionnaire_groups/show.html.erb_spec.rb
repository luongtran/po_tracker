require 'spec_helper'

describe "questionnaire_groups/show.html.erb" do
  before(:each) do
    @questionnaire_group = assign(:questionnaire_group, stub_model(QuestionnaireGroup,
      :questionnaire_id => 1,
      :approver_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
