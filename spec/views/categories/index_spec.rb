require 'rails_helper'

RSpec.describe 'Categories', type: :system, js: true do
  describe 'categories page' do
    before(:each) do
      @user = User.create(name: 'Miliyon', email: 'miliayalew@gmail.com', password: '123456')
      sign_in @user

      @category = Category.create(author: @user, name: 'Shoes', icon: 'https://cdn.pixabay.com/photo/2013/07/12/18/20/shoes-153310__340.png')
      visit categories_path
    end

    it 'It should display category created date' do
      expect(page).to have_content(@category.created_at.strftime('%d %b %Y'))
    end

    it 'It should display the sum of categories expense' do
      expect(page).to have_content(@category.expenses.sum(:amount))
    end

    it 'It should display add new category button' do
      expect(page).to have_content('Add New Category')
    end

    it 'It should add new category' do
      click_link 'Add New Category'
      expect(page).to have_content('New Category')
    end
  end
end
