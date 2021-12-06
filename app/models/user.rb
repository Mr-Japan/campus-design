class User < ApplicationRecord    
  validates :name, presence: true, length: { minimum: 1, maximum: 225 }
  validates :email, {presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }}
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, {presence: true, length: { minimum: 1, maximum: 32 }, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}}
  has_secure_password 
  
  has_many :topics
  has_many :classworks
end
