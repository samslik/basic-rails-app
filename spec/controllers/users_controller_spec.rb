require 'rails_helper'

describe UsersController, :type => :controller do
    before do
      # @user = User.create!(email: "mark@mark.com", password: "markmark")
      # @user2 = User.create!(email: "ted@ted.com", password: "tedted")
      @user = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
    end
  describe 'get #show' do
    context 'User is logged in' do
      before do
        sign_in @user
      end
      it 'loads correct user details' do
        get :show, params: {id: @user.id}
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
      it "can't access show page of the 2. user" do
        get :show, params: {id: @user2.id}
        expect(response).to redirect_to(root_path)
      end
    end
    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, params: {id: @user.id}
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end