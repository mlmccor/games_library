require 'pry'

class UserGamesController < ApplicationController

  get '/user_games/:id' do
    @user_game = UserGame.find(params[:id])
    if current_user == @user_game.user
      erb :'/user_games/edit'
    else
      redirect '/failure'
    end
  end

  patch '/user_games/:id' do
    @user_game = UserGame.find(params[:id])
    @user_game.update(status: params[:status])
    redirect :"/users/#{@user_game.user.slug}"
  end
end
