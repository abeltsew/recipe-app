require 'rails_helper'
require 'faker'

RSpec.describe Recipe, type: :model do
  abel = User.create!(name: Faker::Name.unique.name,
                      email: Faker::Internet.email,
                      password: '1234567', password_confirmation: '1234567')
  subject do
    Recipe.new(name: 'Chicken',
               preparation_time: '1 hr',
               cooking_time: '2 hr',
               description: 'Yemmy drumbs',
               public: false, user: abel)
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a Description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
