class Activity < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :category
  has_many_attached :images, dependent: :destroy
  has_one_attached :thumbnail, dependent: :destroy
  has_many :likes, as: :likable
  has_many :comments

  validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :description, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :category_id, presence: true
end
