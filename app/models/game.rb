class Game < ApplicationRecord
  
  has_many :group_games
  has_many :groups, through: :group_games
  
  has_many :user_games
  has_many :users, through: :user_games

  geocoded_by :zipcode
  after_validation :geocode


  def nearby_groups
    Group.near([latitude,longitude], 30)
  end

  def nearby_users
    User.near([latitude,longitude], 30)
  end
  
end
