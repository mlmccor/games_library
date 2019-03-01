require 'pry'

class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    @games = Game.all
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], username: params[:username], password: params[:password], game_ids: params[:game_ids])
      binding.pry
    redirect '/users/login'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  get '/users/failure' do
    erb :'/users/failure'
  end

  get'/users/:slug' do
    @user = User.find_by_slug
    if current_user == @user
      erb '/users/home'
  end

  post "/users/login" do
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/users/#{user.slug}"
		else
			redirect '/failure'
		end
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
