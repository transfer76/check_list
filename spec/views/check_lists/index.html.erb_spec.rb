require 'rails_helper'

RSpec.describe "check_lists/index", type: :view do
  before(:each) do
    assign(:check_lists, [
      CheckList.create!(),
      CheckList.create!()
    ])
  end

  it "renders a list of check_lists" do
    render
  end
end
