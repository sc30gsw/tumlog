require 'rails_helper'

RSpec.describe "Earlies", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/earlies/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/earlies/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/earlies/show"
      expect(response).to have_http_status(:success)
    end
  end

end
