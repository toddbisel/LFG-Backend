class User < ApplicationRecord

  has_secure_password
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  
  validates :first_name, presence: true, length: {maximum: 10}
  
  validates :last_name, presence: true, length: {maximum: 10}
  
  validates :age, presence: true, numericality: true, numericality: { only_integer: true, :greater_than_or_equal_to => 18 }
  
  validates :zipcode, presence: true, length: { is: 5}, numericality: true
end
