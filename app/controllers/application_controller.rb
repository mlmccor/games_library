require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "G4m3$RCuul"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  register Sinatra::Flash

  get '/' do
    binding.pry
    erb :welcome
  end
end
