class Api::UserGroupsController < ApplicationController

  def create
    @user_group = UserGroup.new(
      user_id: params[:user_id],
      group_id: params[:group_id],
    )

    if @user_group.save
      render 'show.json.jb'
    else
      render json: {errors: @user_group.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    user_group = UserGroup.find_by(id: params[:id])

    user_group.destroy
      
    render json: {message: "User-Group deleted!"}
  end

end