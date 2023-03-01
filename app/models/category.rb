class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :author, message: 'You already have a category with this item' }
  validates :icon, presence: true
end
