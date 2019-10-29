class GroupGame < ApplicationRecord

  belongs_to :game
  belongs_to :group

  # validates :user, presence: true
  # validates :group, presence: true

  validates_uniqueness_of :game_id, :scope => :group_id
end
