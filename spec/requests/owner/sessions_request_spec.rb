require 'rails_helper'

RSpec.describe "Owner::Sessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/owner/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

end
