class Api::UserGamesController < ApplicationController

  def create
    @user_game = UserGame.new(
      user_id: current_user.id,
      game_id: params[:game_id],
    )

    if @user_game.save
      render 'show.json.jb'
    else
      render json: {errors: @user_game.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    user_game = UserGame.find_by(
      game_id: params[:game_id],
      user_id: current_user.id
    )

    user_game.destroy
      
    render 'show.json.jb'
  end

end