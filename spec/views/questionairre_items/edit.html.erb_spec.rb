require 'spec_helper'

describe "questionairre_items/edit.html.erb" do
  before(:each) do
    @questionairre_item = assign(:questionairre_item, stub_model(QuestionairreItem,
      :order => 1,
      :question => "MyString",
      :type => ""
    ))
  end

  it "renders the edit questionairre_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => questionairre_items_path(@questionairre_item), :method => "post" do
      assert_select "input#questionairre_item_order", :name => "questionairre_item[order]"
      assert_select "input#questionairre_item_question", :name => "questionairre_item[question]"
      assert_select "input#questionairre_item_type", :name => "questionairre_item[type]"
    end
  end
end
