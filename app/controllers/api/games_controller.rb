class Api::GamesController < ApplicationController

  def index
    @games = Game.all
    render 'index.json.jb'
  end

  def show
    @game = Game.find_by(id: params[:id])
    render 'show.json.jb'
  end
end