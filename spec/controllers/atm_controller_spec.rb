require 'rails_helper'

RSpec.describe AtmController, type: :controller do
  context 'create' do
    it 'transaction_number should be valid' do
      atm = FactoryGirl.create(:atm)
      post :create, atm: { transaction_number: '4681012' }, format: 'json'
      assigns(:atm).number.should eq '123456789012'
      response.should have_http_status(:created)
    end

    it 'transaction_number should not be valid' do
      post :create, atm: { transaction_number: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'GET#index' do
    it 'atm should be valid' do
      atm = FactoryGirl.create(:atm)
      post :create, atm: { transaction_number: '4681012' }, format: 'json'
      assigns(:atm).number.should eq '123456789012'
      response.should have_http_status(:created)
    end

    it 'atm should not be valid' do
      post :create, atm: { atm: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET#edit' do
    it 'should get correct atm address' do
      atm = FactoryGirl.create(:atm)
      get :edit, code: atm.code, format: 'json'
      assigns(:atm).should eq atm
      response.should have_http_status(:ok)
    end

    it 'should not get corrrect atm address' do
      get :edit, code: Faker::code.code, format: 'json'
      response.should have_http_status(:not_found)
    end
  end
  context 'DELETE#destroy' do
    it 'should destroy atm' do
      atm = FactoryGirl.create(:atm)
      delete :destroy, code: atm.code, format: 'json'
      assigns(:atm).should eq atm
      response.should have_http_status(:ok)
    end

    it 'should not destroy  atm' do
      delete :destroy, code: Faker::Code.code, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
