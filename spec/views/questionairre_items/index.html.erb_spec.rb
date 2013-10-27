require 'spec_helper'

describe "questionairre_items/index.html.erb" do
  before(:each) do
    assign(:questionairre_items, [
      stub_model(QuestionairreItem,
        :order => 1,
        :question => "Question",
        :type => "Type"
      ),
      stub_model(QuestionairreItem,
        :order => 1,
        :question => "Question",
        :type => "Type"
      )
    ])
  end

  it "renders a list of questionairre_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
