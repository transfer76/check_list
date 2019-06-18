require 'rails_helper'

RSpec.describe "check_lists/edit", type: :view do
  before(:each) do
    @list = assign(:list, CheckList.create!())
  end

  it "renders the edit list form" do
    render

    assert_select "form[action=?][method=?]", check_list_path(@list), "post" do
    end
  end
end
