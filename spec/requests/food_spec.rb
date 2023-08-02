require 'rails_helper'
require 'faker'

describe Food, type: :request do
  describe ' foods route should be available' do
    before(:each) do
      @abel = User.create!(name: Faker::Name.unique.name,
                           email: Faker::Internet.email,
                           password: '1234567', password_confirmation: '1234567')
      @shiro = Food.create(name: 'Shiro', measurement_unit: 'KG', price: 45.99, quantity: 2, user: @abel)
    end
    it 'should render the food index action correctly' do
      sign_in @abel
      get '/foods'
      expect(response).to be_successful
      expect(response.body).to include('Shiro')
    end

    it 'should alow users to create foods' do
      sign_in @abel
      get '/foods'
      expect(response).to be_successful
      expect(response.body).to include('Add Food')
    end
  end
end
