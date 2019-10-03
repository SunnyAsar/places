
class User < ApplicationRecord
  has_secure_password

  default_scope { order(created_at: :desc) }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :activities, foreign_key: :owner_id
  has_many :categories
  has_many :comments, foreign_key: :commenter_id
end
