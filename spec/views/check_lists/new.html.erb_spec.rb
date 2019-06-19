require 'rails_helper'

RSpec.describe "check_lists/new", type: :view do
  before(:each) do
    assign(:check_list, CheckList.new())
  end

  it "renders new check_list form" do
    render

    assert_select "form[action=?][method=?]", check_lists_path, "post" do
    end
  end
end
