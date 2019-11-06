class Group < ApplicationRecord


  has_many :user_groups
  has_many :users, through: :user_groups

  has_many :group_games
  has_many :games, through: :group_games


  
  validates :name, presence: true
  
  validates :zipcode, presence: true, length: { is: 5}, numericality: true

  geocoded_by :zipcode
  after_validation :geocode


  def nearby_groups
    Group.near([latitude,longitude], 30000)
  end

  def nearby_users
    User.near([latitude,longitude], 3000000)
  end
end
