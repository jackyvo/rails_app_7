require 'rails_helper'

RSpec.describe "Api::V1::Brands", type: :request do
  describe "POST /api/v1/brands" do
    let(:user) { FactoryBot::create(:user) }
    let(:token) { JWT.encode({user_data: user.id }, 'yoursecretword', "HS256") }

    it "creates new brand" do
      expect {
        post api_v1_brands_path, params: { brand: { name: "Brand 1" } }, headers: { "Authorization": "Token token=#{token}" }
      }.to change(Brand, :count).by(1)

      expect(response).to have_http_status(201)
    end
  end
end
