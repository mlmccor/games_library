require 'pry'

class UsersController < ApplicationController

  get '/users' do
    binding.pry
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    @games = Game.all
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], username: params[:username], password: params[:password])
  end


  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end
