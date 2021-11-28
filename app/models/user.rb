class User < ApplicationRecord    
  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :email, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, length: { minimum: 1, maximum: 32 }, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}
  has_secure_password 
end
