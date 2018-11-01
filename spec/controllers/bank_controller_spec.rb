require 'rails_helper'

RSpec.describe BankController, type: :controller do
  context 'POST#create' do
    it 'should create bank successfully' do
      post :create, bank: { code: 'HDFC', address: '1012 Kristin Underpass', phone_no: '1234567890', code: '3A53F' }, format: 'json'
      assigns(:bank).code.should eq 'HDFC'
      assigns(:bank).address.should eq '1012 Kristin Underpass'
      assigns(:bank).phone_no.should eq '1234567890'
      assigns(:bank).code.should eq '3A53F'
      response.should have_http_status(:created)
    end

    it 'should not create bank with invalid inputs' do
      post :create, bank: { code: nil, address: nil, phone_no: nil, code: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'GET#index' do
    it 'should show all banks successfully' do
      bank1 = FactoryGirl.create(:bank)
      bank2 = FactoryGirl.create(:bank)
      get :index, format: 'json'
      assigns(:banks).should include bank1
      assigns(:banks).should include bank2
      response.should have_http_status(:ok)
    end
  end

  context 'GET#show' do
    it 'should get bank successfully' do
      bank = FactoryGirl.create(:bank)
      get :show, code: Faker::Bank.code, format: 'json'
      assigns(:bank).should eq bank
      response.should have_http_status(:ok)
    end

    it 'should not get invalid bank' do
      get :show, code: Faker::Bank.code, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'GET#edit' do
    it 'should get correct bank successfully' do
      bank = FactoryGirl.create(:bank)
      get :edit, code: bank.code, format: 'json'
      assigns(:bank).should eq bank
      response.should have_http_status(:ok)
    end

    it 'should not get bank with invalid id' do
      get :edit, code: Faker::code.code, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE#destroy' do
    it 'should destroy bank successfully' do
      bank = FactoryGirl.create(:bank)
      delete :destroy, code: bank.code, format: 'json'
      assigns(:bank).should eq bank
      response.should have_http_status(:ok)
    end

    it 'should not destroy invalid bank' do
      delete :destroy, code: Faker::Code.code, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
