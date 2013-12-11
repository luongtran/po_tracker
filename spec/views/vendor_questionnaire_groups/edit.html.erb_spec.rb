require 'spec_helper'

describe "vendor_questionnaire_groups/edit.html.erb" do
  before(:each) do
    @vendor_questionnaire_group = assign(:vendor_questionnaire_group, stub_model(VendorQuestionnaireGroup,
      :approval_status => "MyString",
      :string, => "MyString",
      :questionnaire_group_id => 1
    ))
  end

  it "renders the edit vendor_questionnaire_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vendor_questionnaire_groups_path(@vendor_questionnaire_group), :method => "post" do
      assert_select "input#vendor_questionnaire_group_approval_status", :name => "vendor_questionnaire_group[approval_status]"
      assert_select "input#vendor_questionnaire_group_string,", :name => "vendor_questionnaire_group[string,]"
      assert_select "input#vendor_questionnaire_group_questionnaire_group_id", :name => "vendor_questionnaire_group[questionnaire_group_id]"
    end
  end
end
