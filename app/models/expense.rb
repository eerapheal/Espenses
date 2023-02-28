class Expense < ApplicationRecord
  belongs_to :author

  validates :name, presence: true, uniqueness: { scope: :author, message: 'Expenses exit' }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
