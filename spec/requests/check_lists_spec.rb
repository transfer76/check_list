require 'rails_helper'

RSpec.describe "Lists", type: :request do
  describe "GET /check_lists" do
    it "works! (now write some real specs)" do
      get check_check_lists_path
      expect(response).to have_http_status(200)
    end
  end
end
