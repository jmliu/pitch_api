class GamesController < ApplicationController

  def index
    @games = Game.find_each
  end

  def show
    @game = Game.find_by(game_id: params[:game_id])

    unless @game
      render json: { errors: 'Game Not Found' }
    end
  end
end
