# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: user
    else
      render json: { message: 'Invalid username & password' }
    end
  end

  # GET /users/1
  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], location: params[:location])

    if @user.save
      render json: @user, status: :created, location: @user
    else
      puts 'failed'
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /user/:id/goods
  def user_goods
    @user = User.find_by(id: params[:id])
    @goods = GoodsAndService.all.where(user_id: @user.id).order(created_at: :desc)
    render json: @goods
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :password, :email, :location)
  end
end
