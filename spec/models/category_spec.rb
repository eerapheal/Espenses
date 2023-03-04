require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    User.create(name: 'Miliyon', email: 'miliayalew@gmail.com', password: '123456')
  end

  before(:each) do
    @category = Category.new(name: 'Shoes',
                             icon: 'https://cdn.pixabay.com/photo/2013/07/12/18/20/shoes-153310__340.png',
                             author_id: subject.id)
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@category).to be_valid
    end

    it 'Category should have a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'Category should have an icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end

    it 'Category should have a author' do
      @category.author_id = nil
      expect(@category).to_not be_valid
    end
  end

  context 'Testing associations' do
    it 'Category should belong to an author' do
      subject = Category.reflect_on_association(:author)
      expect(subject.macro).to eq(:belongs_to)
    end

    it 'Category should have many category_expenses' do
      subject = Category.reflect_on_association(:category_expenses)
      expect(subject.macro).to eq(:has_many)
    end

    it 'Category should have many expenses' do
      subject = Category.reflect_on_association(:expenses)
      expect(subject.macro).to eq(:has_many)
    end
  end
end