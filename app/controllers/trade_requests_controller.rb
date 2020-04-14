# frozen_string_literal: true

class TradeRequestsController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]

  # GET /trade_requests
  def index
    @trade_requests = TradeRequest.all

    render json: @trade_requests
  end

  # GET /trade_requests/1
  def show
    @trade_request = TradeRequest.find_by(id: params[:id])
    render json: @trade_request
  end

  # POST /trade_request
  def create
    @trade_request = TradeRequest.new(initiating_user_id: params[:initiating_user_id], receiving_user_id: params[:receiving_user_id], status: params[:status], initiator_complete: params[:initiator_complete], receiver_complete: params[:receiver_complete])

    if @trade_request.save
      render json: @trade_request, status: :created, location: @trade_request
    else
      puts 'failed'
      render json: @trade_request.errors, status: :unprocessable_entity
    end
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
  def trade_request_params
    params.require(:trade_request).permit(:id, :initiating_user_id, :receiving_user_id, :status, :initiator_complete, :receiver_complete)
  end
end
