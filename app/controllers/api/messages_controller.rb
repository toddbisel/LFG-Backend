class Api::MessagesController < ApplicationController

  def create
    @message = Message.new(
      body: params[:body],
      user_id: current_user.id,
      conversation_id: params[:conversation_id]
      )
    if @message.save

      ActionCable.server.broadcast "messages_channel", {
        id: @message.id,
        first_name: @message.user.first_name,
        body: @message.body,
        conversation_id: @message.conversation_id,
        created_at: @message.created_at.strftime("%b %e, %l:%M %p")
      }

      render 'show.json.jb'
    else
      render json: {errors: @message.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @message = Message.find_by(id: params[:id])
    render 'show.json.jb'
  end
end
