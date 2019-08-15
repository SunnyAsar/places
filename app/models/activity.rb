class Activity < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :category


  valides :name, presence: true, uniqueness: true, length: { minimum: 10 }
end
