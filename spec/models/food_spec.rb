require 'rails_helper'

RSpec.describe Food, type: :model do
  abel = User.create!(name: Faker::Name.unique.name,
                      email: Faker::Internet.email,
                      password: '1234567', password_confirmation: '1234567')
  subject do
    Food.new(name: 'Chicken',
             quantity: 2,
             measurement_unit: 'kg',
             price: 45,
             user: abel)
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'should have a number' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end
end
