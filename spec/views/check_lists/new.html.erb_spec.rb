require 'rails_helper'

RSpec.describe "check_lists/new", type: :view do
  before(:each) do
    assign(:list, CheckList.new())
  end

  it "renders new list form" do
    render

    assert_select "form[action=?][method=?]", check_check_lists_path, "post" do
    end
  end
end
