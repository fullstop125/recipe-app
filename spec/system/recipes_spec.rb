require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  user = User.create(name: 'Hassan', email: 'hassan@gmail.com', password: 'password')

  subject do
    Recipe.new(name: 'Fried rice', description: 'Deligious fried rice', user_id: user.id)
  end
  before { subject.save }

  describe 'index page' do
    it 'I can see the button.' do
      visit recipes_path
      page.has_button?('New Recipe')
    end
    it 'I can see the recipe name.' do
      visit recipes_path
      page.has_content?('Frid rice')
    end
    it 'I can see the recipe description.' do
      visit recipes_path
      page.has_content?('Deligious fried rice')
    end
  end
end
