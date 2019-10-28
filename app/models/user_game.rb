class UserGame < ApplicationRecord

  belongs_to :game
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :game_id
  
end
