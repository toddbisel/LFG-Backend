class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render 'index.json.jb'
  end

  def create
    @user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      first_name: params[:first_name],
      last_name: params[:last_name],
      age: params[:age],
      bio: params[:bio],
      zipcode: params[:zipcode],
      image: params[:image]
    )

    if @user.save
      render 'show.json.jb'
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def update
    @user = User.find_by(id: params[:id])

    @user.email = params[:email] || @user.email
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.age = params[:age] || @user.age
    @user.bio = params[:bio] || @user.bio
    @user.zipcode = params[:zipcode] || @user.zipcode
    @user.image = params[:image] || @user.image

    
    @user.password = params[:password] || @user.password_digest

    if @user.save
      render 'show.json.jb'
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy

    render json: {message: "User deleted!"}
    
  end
  
end