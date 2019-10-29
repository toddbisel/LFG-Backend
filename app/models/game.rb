class Game < ApplicationRecord
  
  has_many :group_games
  has_many :groups, through: :group_games
  
  has_many :user_games
  has_many :users, through: :user_games
  
end
