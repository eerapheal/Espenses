class Category < ApplicationRecord
  belongs_to :author

  validates :name, presence: true, uniqueness: { scope: :author, message: 'You already have a category with this item' }
  validates :icon, presence: true
end
