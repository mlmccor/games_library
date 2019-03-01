class User < ActiveRecord::Base
  require_relative 'concerns/slugifiable'
  has_secure_password
  has_many :user_games
  has_many :games, through: :user_games
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
end
