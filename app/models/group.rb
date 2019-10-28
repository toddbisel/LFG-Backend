class Group < ApplicationRecord

  has_many :user_groups
  has_many :users, through: :user_groups

  








  validates :name, presence: true
  
  validates :zipcode, presence: true, length: { is: 5}, numericality: true
end
