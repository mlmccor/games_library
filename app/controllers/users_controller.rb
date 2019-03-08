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
    redirect '/users/login'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  get '/users/failure' do
    erb :'/users/failure'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @user_games = @user.user_games
    erb :'/users/home'
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

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])
    if current_user == @user
      @games = Game.all
      erb :'/users/edit'
    else
      redirect '/failure'
    end
  end

  patch '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @user.update(name: params[:name], username: params[:username], password: params[:password], game_ids: params[:game_ids])
    @user.save
    redirect "/users/#{@user.slug}"
  end

  delete '/users/:slug/delete' do
    @user = User.find_by_slug(params[:slug])
    if current_user == @user
      @user.destroy
      redirect '/'
    else
      redirect '/failure'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
