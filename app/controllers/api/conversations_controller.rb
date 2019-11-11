class Api::ConversationsController < ApplicationController

  before_action :authenticate_user

  def index
    @conversations = current_user.conversations.order(created_at: :desc)
    render 'index.json.jb'
  end

  def show
    @conversation = Conversation.find(params[:id])
    @conversation.messages.sort
    render 'show.json.jb'
  end
  

  def create
    matched_user = params[:recipient_id]

    if Conversation.between(current_user.id, matched_user)
     .present? 
      @conversation = Conversation.between(current_user.id,
       matched_user).first
    else
      @conversation = Conversation.new(
        sender_id: current_user.id,
        recipient_id: matched_user)
    end

    if @conversation.save
      render 'show.json.jb'
    else
      render json: {errors: @conversation.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
