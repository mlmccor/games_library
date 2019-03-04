class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
end
