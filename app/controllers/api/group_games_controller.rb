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
    @group_game = GroupGame.find_by(group_id: params[:group_id], game_id: params[:game_id])

    if @group_game.save
      @group_game.destroy
      render json: {message: "Group-Game deleted!"} 
      else
        render json: {errors: @group_game.errors.full_messages}, status: :bad_request
    end 
  end
end
