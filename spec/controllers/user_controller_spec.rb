require 'rails_helper'

RSpec.describe UserController, type: :controller do
  context 'POST#create' do
    it 'should name valid' do
      user = FactoryGirl.create(:user)
      post :create, user: { name: 'abc' }, format: 'json'
      assigns(:user).number.should eq 'abc'
      response.should have_http_status(:created)
    end

    it 'should not user valid' do
      post :create, user: { name: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should account_number valid' do
      user = FactoryGirl.create(:user)
      post :create, user: { account_number: '45678932154698' }, format: 'json'
      assigns(:user).number.should eq 'abc'
      response.should have_http_status(:created)
    end

    it 'should not account_number valid' do
      post :create, user: { account_number: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should number valid' do
      user = FactoryGirl.create(:user)
      post :create, user: { number: '6332154698' }, format: 'json'
      assigns(:user).number.should eq '6332154698'
      response.should have_http_status(:created)
    end

    it 'should not number valid' do
      post :create, user: {number: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should address valid' do
      user = FactoryGirl.create(:user)
      post :create, user: { address: 'xyz' }, format: 'json'
      assigns(:user).number.should eq 'xyz'
      response.should have_http_status(:created)
    end

    it 'should not address valid' do
      post :create, user: { address: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  it 'should Email valid' do
    user = FactoryGirl.create(:user)
    post :create, user: { email: 'xyz@gmail.com' }, format: 'json'
    assigns(:user).number.should eq 'xyz@gmail.com'
    response.should have_http_status(:created)
  end

  it 'should not Email valid' do
    post :create, user: { email: nil }, format: 'json'
    response.should have_http_status(:unprocessable_entity)
  end
  it 'should password valid' do
    user = FactoryGirl.create(:user)
    post :create, user: { password: '********' }, format: 'json'
    assigns(:user).number.should eq '********'
    response.should have_http_status(:created)
  end

  it 'should not password valid' do
    post :create, user: { password: nil }, format: 'json'
    response.should have_http_status(:unprocessable_entity)
  end
end

  context 'GET#index' do
    it 'should show all user' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      get :index, format: 'json'
      assigns(:user).should include user1
      assigns(:user).should include user2
      response.should have_http_status(:ok)
    end
  end

  context 'PUT#update' do
    it 'should update user successfully' do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      put :update, number: user1.number, user: { number: user2.number }, format: 'json'
      assigns(:user).number.should eq user1.number
      assigns(:user).number.should eq user2.number
      response.should have_http_status(:ok)
    end

    it 'should not update user with invalid inputs' do
      user1 = FactoryGirl.create(:user)
      put :update, number: user1.number, user: { number: nil }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not update user with invalid category' do
      user2 = FactoryGirl.create(:user)
      put :update, number: '1234567890', user: { number: user2.number }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET#show' do
    it 'should get user all' do
      user = FactoryGirl.create(:user)
      get :show, name: user.name, format: 'json'
      assigns(:user).should eq user
      response.should have_http_status(:ok)
    end

    it 'should not get invalid user' do
      get :show, name: Faker::Name.name, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'GET#new' do
    it 'should get new user successfully' do
      get :new, format: 'json'
      assigns(:user).number.should eq nil
      assigns(:user).number.should eq nil
      response.should have_http_status(:ok)
    end
  end

  context 'GET#edit' do
    it 'should get correct user successfully' do
      user = FactoryGirl.create(:user)
      get :edit, number: user.number, format: 'json'
      assigns(:user).should eq user
      response.should have_http_status(:ok)
    end

    it 'should not get user with invalid id' do
      get :edit, number: Faker::Number.number, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE#destroy' do
    it 'should destroy user successfully' do
      user = FactoryGirl.create(:user)
      delete :destroy, number: user.number, format: 'json'
      assigns(:user).should eq user
      response.should have_http_status(:ok)
    end

    it 'should not destroy invalid user' do
      delete :destroy, number: Faker::Number.number, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

end
