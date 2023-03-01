class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, foreign_key: :author_id, dependent: :destroy
  has_many :expeneses, foreign_key: :author_id, dependent: :destroy

  validates :name, :email, :password, presence: true
end
