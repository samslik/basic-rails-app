require 'rails_helper'

describe ProductsController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
    @product = FactoryGirl.create(:product)
    (0..6).each do
      FactoryGirl.create(:product)
    end

    (0..6).each do
      FactoryGirl.create(:comment, user: @user, product: @product)
    end
  end

  describe 'index' do
    it 'should show all products' do
      get :index
      expect(response).to have_http_status(200)
      expect(assigns(:products).length).to eq 8
    end
    it 'should show search results' do
      get :index, params: {q: 'cool'}
      expect(response).to have_http_status(200)
      #only every second product is cool
      expect(assigns(:products).length).to eq 4
    end
  end

  describe 'show' do
    it 'should show 5 comments on the first page' do
      get :show, params: {id: @product.id}
      expect(response).to have_http_status(200)
      expect(assigns(:product)).to eq @product

      expect(assigns(:product).comments.length).to eq 7
      expect(assigns(:comments).length).to eq 5
    end
    it 'should show 2 comments on the second page' do
      get :show, params: {id: @product.id, page: 2}
      expect(response).to have_http_status(200)
      expect(assigns(:product)).to eq @product

      expect(assigns(:comments).length).to eq 2
    end
    it 'should show 0 comments on the third page' do
      get :show, params: {id: @product.id, page: 3}
      expect(response).to have_http_status(200)
      expect(assigns(:product)).to eq @product

      expect(assigns(:comments).length).to eq 0
    end
  end

end