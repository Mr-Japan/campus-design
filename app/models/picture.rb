class Picture < ApplicationRecord
  validates :image, presence: true
  
  belongs_to :classwork
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
