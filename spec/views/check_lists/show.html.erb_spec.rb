require 'rails_helper'

RSpec.describe "check_lists/show", type: :view do
  before(:each) do
    @check_list = assign(:check_list, CheckList.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
