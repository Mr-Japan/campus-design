class Classwork < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :pictures
end
