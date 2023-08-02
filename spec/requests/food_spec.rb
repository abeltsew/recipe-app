require 'rails_helper'
require 'faker'

describe Food, type: :request do
  describe ' foods route should be available' do
    it 'should render the index action correctly' do
      get '/'
      expect(response).to be_successful
      expect(response).to render_template('recipies/public_recipies')
    end
  end
end
