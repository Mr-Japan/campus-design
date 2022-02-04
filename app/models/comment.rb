class Comment < ApplicationRecord
  validates :content, presence: true
  # validates :picture, presence: true
  belongs_to :classwork
  belongs_to :user
end
