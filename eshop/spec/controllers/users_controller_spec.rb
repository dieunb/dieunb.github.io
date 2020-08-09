require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      post :create, params: { user: { email: 'ahihi@demo.com', password: '123456', password_confirmation: '123456' } }
      expect(User.count).to eql(1)
      expect(response).to redirect_to(root_path)
    end
  end
end
