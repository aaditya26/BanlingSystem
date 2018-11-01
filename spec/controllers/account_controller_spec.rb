require 'rails_helper'

RSpec.describe AccountController, type: :controller do
  context 'POST#create' do
    it 'should create account successfully' do
      account = FactoryGirl.create(:account)
      post :create, account: { number: '123456789012' }, format: 'json'
      assigns(:account).number.should eq '123456789012'
      response.should have_http_status(:created)
    end

    it 'should not create account with invalid inputs' do
      post :create, account: { number: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET#index' do
    it 'should show all account' do
      account1 = FactoryBot.create(:account)
      account2 = FactoryBot.create(:account)
      get :index, format: 'json'
      assigns(:account).should include account1
      assigns(:account).should include account2
      response.should have_http_status(:ok)
    end
  end

  context 'PUT#update' do
    it 'should update account successfully' do
      account1 = FactoryGirl.create(:account)
      account2 = FactoryGirl.create(:account)
      put :update, number: account1.number, account: { number: account2.number }, format: 'json'
      assigns(:account).number.should eq account1.number
      assigns(:account).number.should eq account2.number
      response.should have_http_status(:ok)
    end

    it 'should not update account with invalid inputs' do
      account1 = FactoryGirl.create(:account)
      put :update, number: account1.number, account: { number: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not update account with invalid category' do
      account2 = FactoryGirl.create(:account)
      put :update, number: '1234567890', account: { number: account2.number }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET#show' do
    it 'should get account successfully' do
      account = FactoryGirl.create(:account)
      get :show, number: account.number, format: 'json'
      assigns(:account).should eq account
      response.should have_http_status(:ok)
    end

    it 'should not get invalid account' do
      get :show, number: Faker::Number.number, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'GET#new' do
    it 'should get new account successfully' do
      get :new, format: 'json'
      assigns(:account).number.should eq nil
      assigns(:account).number.should eq nil
      response.should have_http_status(:ok)
    end
  end

  context 'GET#edit' do
    it 'should get correct account successfully' do
      account = FactoryGirl.create(:account)
      get :edit, number: account.number, format: 'json'
      assigns(:account).should eq account
      response.should have_http_status(:ok)
    end

    it 'should not get account with invalid id' do
      get :edit, number: Faker::Number.number, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE#destroy' do
    it 'should destroy account successfully' do
      account = FactoryGirl.create(:account)
      delete :destroy, number: account.number, format: 'json'
      assigns(:account).should eq account
      response.should have_http_status(:ok)
    end

    it 'should not destroy invalid account' do
      delete :destroy, number: Faker::Number.number, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
