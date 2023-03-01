class User < ApplicationRecord
  has_many :categories, foreign_key: :author_id, dependent: :destroy
  has_many :expeneses, foreign_key: :author_id, dependent: :destroy

  validates :name, :email, :password, presence: true
end
