class User < ApplicationRecord

  # attr_accessor :first_name, :last_name

  has_secure_password
  
  has_many :user_groups
  has_many :groups, through: :user_groups

  has_many :user_games
  has_many :games, through: :user_games

  has_many :messages, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  
  validates :first_name, presence: true, length: {maximum: 25}
  
  validates :last_name, presence: true, length: {maximum: 25}
  
  validates :age, presence: true, numericality: true, numericality: { only_integer: true, :greater_than_or_equal_to => 18 }
  
  validates :zipcode, presence: true, length: { is: 5}, numericality: true

  geocoded_by :zipcode
  after_validation :geocode

  def nearby_groups
    Group.near([latitude,longitude], 30)
  end

  def nearby_users
    User.near([latitude,longitude], 30)
  end

  def conversations
    Conversation.where("sender_id = ? OR recipient_id = ?", id,id)
  end

  # def name
  #   [@first_name,@last_name].reject(&:blank?).join(' ').titleize
  # end
  
  

end
