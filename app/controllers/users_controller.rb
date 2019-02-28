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
    redirect '/users/login'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  get '/users/failure' do
    erb :'/users/failure'
  end

  get'/users/home' do
    @user
  end

  post "/users/login" do
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect '/users/home'
		else
			redirect '/failure'
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
