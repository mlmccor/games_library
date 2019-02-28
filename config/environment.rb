require 'bundler'
require 'open-uri'

Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
require_all 'app'
require_all 'lib'
