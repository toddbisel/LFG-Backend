class Api::GroupsController < ApplicationController

  def index
    @groups = Group.all
    render 'index.json.jb'
  end

  def create
    group = Group.new(
      name: params[:name],
      description: params[:description],
      zipcode: params[:zipcode],
      image: params[:image]
      
    )

    if group.save
      render json: {message: 'Group created successfully'}, status: :created
    else
      render json: {errors: group.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def update
    @group = Group.find_by(id: params[:id])

    @group.name = params[:name] || @group.name
    @group.description = params[:description] || @group.description
    @group.zipcode = params[:zipcode] || @group.zipcode
    @group.image = params[:image] || @group.image
    

    if @group.save
      render 'show.json.jb'
    else
      render json: {errors: @group.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    group = Group.find_by(id: params[:id])
    group.destroy

    render json: {message: "group deleted!"}
    
  end
end

