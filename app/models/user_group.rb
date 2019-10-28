class UserGroup < ApplicationRecord

  belongs_to :user
  belongs_to :group

  # validates :user, presence: true
  # validates :group, presence: true

  validates_uniqueness_of :user_id, :scope => :group_id

end
