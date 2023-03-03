require 'rails_helper'

RSpec.describe 'Expenses', type: :system, js: true do
  describe 'Expenses page' do
    before(:each) do
      @user = User.create(name: 'Miliyon', email: 'miliayalew@gmail.com', password: '123456')
      sign_in @user

      @category = Category.create(author: @user, name: 'Shoes', icon: 'https://cdn.pixabay.com/photo/2013/07/12/18/20/shoes-153310__340.png')
      @expense = Expense.create(author: @user, name: 'vans', amount: 100)
      @category_expense = CategoryExpense.create(category: @category, expense: @expense)
      visit category_expenses_path(@category)
    end

    it 'It should display transaction on the navbar name' do
      expect(page).to have_content('Transaction')
    end

    it 'It should display expense name' do
      expect(page).to have_content(@expense.name)
    end

    it 'It should display expense amount' do
      expect(page).to have_content(@expense.amount)
    end

    it 'It should display category total expense' do
      expect(page).to have_content(@category.expenses.sum(:amount))
    end

    it 'It should display add new transaction button' do
      expect(page).to have_content('Add a new Transaction')
    end

    it 'It should display category icon' do
      expect(page.body).to include(@category.icon)
    end

    it 'It should display category created date' do
      expect(page).to have_content(@expense.created_at.strftime('%d %b %Y'))
    end
  end
end
