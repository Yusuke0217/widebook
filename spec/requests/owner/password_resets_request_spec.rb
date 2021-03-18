require 'rails_helper'

RSpec.describe "Owner::PasswordResets", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/owner/password_resets/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/owner/password_resets/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
