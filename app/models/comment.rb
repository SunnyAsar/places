class Comment < ApplicationRecord

  validates :content, presence: true

  belongs_to :activity
  belongs_to :commenter, class_name: :User
  has_many :likes, as: :likable

end
