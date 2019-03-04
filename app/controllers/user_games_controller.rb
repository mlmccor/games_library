require 'pry'

class UserGamesController < ApplicationController

  get '/user_games/:id' do
    @user_game = UserGame.find(params[:id])
    erb :'/user_games/edit'
  end

  patch '/user_games/:id' do
    binding.pry
    @user_game = UserGame.find(params[:id])
    @user_game.update(status: params[:status])
    redirect :"/users/#{@user_game.user.slug}"
  end
end
