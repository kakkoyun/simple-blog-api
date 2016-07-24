require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users" do

    before(:each) {}

    it 'should return success as status' do
      get api_v1_users_path
      expect(response).to have_http_status(200)
    end

    it 'should give all all users' do
      create_list(:user, 5)
      get api_v1_users_path
      deserialized_users = JSON.parse(response.body, symbolize_names: true)
      expect(deserialized_users).to match_array serialize_collection(User.all, each_serializer: UserSerializer)
    end
  end

  describe "POST /users" do
    it "should create a user"
  end

  describe "GET /users/:id" do
    it "should show given user"
  end

  describe "PUT /users/:id" do
    it "should update given user"
  end

  describe "PATCH /users/:id" do
    it "should update given user"
  end

  describe "DELETE /users/:id" do
    it "should destroy given user"
  end
end
