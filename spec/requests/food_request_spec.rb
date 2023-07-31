require 'rails_helper'
require 'faker'

describe Food, type: :request do
  describe ' foods route should be available' do
    it 'should render the index action correctly' do
      get '/foods'
      expect(response).to be_successful
      expect(response).to rendered_template('foods#index')
      expect(response).to Include('Add Foods')
    end
  end
end
