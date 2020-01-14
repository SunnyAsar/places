class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :activities
  belongs_to :user
end
