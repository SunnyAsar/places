class Activity < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :category
  has_many_attached :images

  validates :name, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :description, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :category_id, presence: true  
end
