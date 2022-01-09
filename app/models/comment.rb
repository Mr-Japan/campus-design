class Comment < ApplicationRecord
  # validates :comment, presence: true
  # validates :picture, presence: true
  belongs_to :classwork
  belongs_to :user
end
