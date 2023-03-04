require 'rails_helper'

RSpec.describe CategoryExpense, type: :model do
  subject do
    User.create(name: 'Miliyon', email: 'miliayalew@gmail.com', password: '123456')
  end

  before(:each) do
    @expense = Expense.new(name: 'Shoes', amount: 100, author_id: subject.id)
    @category = Category.new(name: 'Shoes',
                             icon: 'https://cdn.pixabay.com/photo/2013/07/12/18/20/shoes-153310__340.png',
                             author_id: subject.id)
    @category_expense = CategoryExpense.new(expense: @expense, category: @category)
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@category_expense).to be_valid
    end
  end

  context 'Testing associations' do
    it 'CategoryExpense should belong to an expense' do
      subject = CategoryExpense.reflect_on_association(:expense)
      expect(subject.macro).to eq(:belongs_to)
    end

    it 'CategoryExpense should belong to a category' do
      subject = CategoryExpense.reflect_on_association(:category)
      expect(subject.macro).to eq(:belongs_to)
    end
  end
end