require 'spec_helper'

describe "vendor_questionnaire_assignments/new.html.erb" do
  before(:each) do
    assign(:vendor_questionnaire_assignment, stub_model(VendorQuestionnaireAssignment,
      :employee_id => ""
    ).as_new_record)
  end

  it "renders new vendor_questionnaire_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vendor_questionnaire_assignments_path, :method => "post" do
      assert_select "input#vendor_questionnaire_assignment_employee_id", :name => "vendor_questionnaire_assignment[employee_id]"
    end
  end
end
