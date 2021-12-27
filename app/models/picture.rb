class Picture < ApplicationRecord
  belongs_to :classwork
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
