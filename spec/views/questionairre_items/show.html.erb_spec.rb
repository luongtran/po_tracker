require 'spec_helper'

describe "questionairre_items/show.html.erb" do
  before(:each) do
    @questionairre_item = assign(:questionairre_item, stub_model(QuestionairreItem,
      :order => 1,
      :question => "Question",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Question/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
  end
end
