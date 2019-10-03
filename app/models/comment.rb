class Comment < ApplicationRecord

  validates :content, presence: true

  belongs_to :activity
  belongs_to :commenter, class_name: :user
  has_many :likes, as: :likable

end
