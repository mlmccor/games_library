require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "G4m3$RCuul"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  register Sinatra::Flash

  get '/' do
    session.clear
    erb :welcome
  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end

    def authorize_user(user)
      if !(logged_in? && current_user == user)
        flash[:message] = "You don't have access to this page"
        redirect '/users/failure'
      end
    end

	end
end
