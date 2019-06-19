require 'rails_helper'

RSpec.describe "check_lists/edit", type: :view do
  before(:each) do
    @check_list = assign(:check_list, CheckList.create!())
  end

  it "renders the edit check_list form" do
    render

    assert_select "form[action=?][method=?]", check_list_path(@check_list), "post" do
    end
  end
end
