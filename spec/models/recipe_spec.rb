require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create(name: 'profsain', email: 'profsain@mail.com', password: 'password')
    Recipe.create(name: 'Amala', description: 'This is Amala description', public: true, preparation_time: '1 hours', cooking_time: '30 minutes', user: @user)
  end

  before(:each) { subject.save }

  it 'should have name Amala' do
    expect(subject.name).to eql('Amala')
  end

  it 'should have description "This is Amala description"' do
    expect(subject.description).to eql('This is Amala description')
  end

  it 'Should always have Measurement unit present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'should have public of true' do
    expect(subject.public).to eql(true)
  end
end
