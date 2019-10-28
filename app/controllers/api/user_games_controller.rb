class Api::UserGamesController < ApplicationController

  def create
    @user_game = UserGame.new(
      user_id: params[:user_id],
      game_id: params[:game_id],
    )

    if @user_game.save
      render 'show.json.jb'
    else
      render json: {errors: @user_game.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy

    render json: {message: "User deleted!"}  
  end
end
