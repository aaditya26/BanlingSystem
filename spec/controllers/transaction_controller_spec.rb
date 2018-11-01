require 'rails_helper'

RSpec.describe TransactionController, type: :controller do
  context 'POST#create' do
    it 'should valid transactionNumber' do
      transaction = FactoryGirl.create(:transaction)
      post :create, transaction: { number: '123456789012' }, format: 'json'
      assigns(:transaction).number.should eq '123456789012'
      response.should have_http_status(:created)
    end

    it 'should not transaction valid' do
      post :create, transaction: { number: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET#index' do
    it 'should show all transaction' do
      transaction1 = FactoryBot.create(:transaction)
      transaction2 = FactoryBot.create(:transaction)
      get :index, format: 'json'
      assigns(:transaction).should include transaction1
      assigns(:transaction).should include transaction2
      response.should have_http_status(:ok)
    end
  end

  context 'PUT#update' do
    it 'should update transaction successfully' do
      transaction1 = FactoryGirl.create(:transaction)
      transaction2 = FactoryGirl.create(:transaction)
      put :update, number: transaction1.number, transaction: { number: transaction2.number }, format: 'json'
      assigns(:transaction).number.should eq transaction1.number
      assigns(:transaction).number.should eq transaction2.number
      response.should have_http_status(:ok)
    end

    it 'should not update transaction with invalid inputs' do
      transaction1 = FactoryGirl.create(:transaction)
      put :update, number: transaction1.number, transaction: { number: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not update transaction with invalid category' do
      transaction2 = FactoryGirl.create(:transaction)
      put :update, number: '1234567890', transaction: { number: transaction2.number }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET#show' do
    it 'should get transaction successfully' do
      transaction = FactoryGirl.create(:transaction)
      get :show, number: transaction.number, format: 'json'
      assigns(:transaction).should eq transaction
      response.should have_http_status(:ok)
    end

    it 'should not get valid transaction' do
      get :show, number: Faker::Number.number, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  it 'should balance valid amount' do
    transaction = FactoryGirl.create(:transaction)
    get :edit, number: transaction.number, format: 'json'
    assigns(:transaction).should eq transaction
    response.should have_http_status(:ok)
  end

  it 'shouls not balance valid amount' do
    get :edit, number: Faker::Number.number, format: 'json'
    response.should have_http_status(:not_found)
  end
end
  context 'GET#new' do
    it 'should get new transaction successfully' do
      get :new, format: 'json'
      assigns(:transaction).number.should eq nil
      assigns(:transaction).number.should eq nil
      response.should have_http_status(:ok)
    end
  end

  context 'GET#edit' do
    it 'should get correct transaction successfully' do
      transaction = FactoryGirl.create(:transaction)
      get :edit, number: transaction.number, format: 'json'
      assigns(:transaction).should eq transaction
      response.should have_http_status(:ok)
    end

    it 'should not get transaction with valid id' do
      get :edit, number: Faker::Number.number, format: 'json'
      response.should have_http_status(:not_found)
    end
  end
    context 'DELETE#destroy' do
    it 'should destroy transaction successfully' do
      transaction = FactoryGirl.create(:transaction)
      delete :destroy, number: transaction.number, format: 'json'
      assigns(:transaction).should eq transaction
      response.should have_http_status(:ok)
    end

    it 'should not destroy invalid transaction' do
      delete :destroy, number: Faker::Number.number, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

end
