class Api::GroupGamesController < ApplicationController

  def create
    @group_game = GroupGame.new(
      group_id: params[:group_id],
      game_id: params[:game_id],
    )

    if @group_game.save
      render 'show.json.jb'
    else
      render json: {errors: @group_game.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    group_game = GroupGame.find_by(
      game_id: params[:game_id],
      group_id: params[:group_id]
    )

    group_game.destroy
      
    render 'show.json.jb'
  end

end