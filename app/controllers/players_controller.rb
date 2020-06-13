class PlayersController < ApplicationController
  def index
    render json: Player.list(year: params[:year], team: params[:team])
  end
end
