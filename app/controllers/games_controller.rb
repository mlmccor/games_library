class GamesController < ApplicationController
  require 'pry'

  get '/games' do
    @games = Game.all
    erb :'/games/index'
  end

  get '/games/:slug' do
    @game = Game.find_by_slug(params[:slug])
    erb :'/games/show'
  end
end
