# frozen_string_literal: true

class TradeRequestItemsController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]

  # GET /trade_requests_items
  def index
    @trade_request_items = TradeRequestItem.all

    render json: @trade_request_items
  end

  # GET /trade_requests/1
  def show
    @trade_request_item = TradeRequestItem.find_by(id: params[:id])
    render json: @trade_request_item
  end

  # POST /trade_request
  def create
    @trade_request_item = TradeRequestItem.new(
      trade_request_id: params[:trade_request_id],
      item_id: params[:item_id],
      locked: params[:locked],
      amount: params[:amount]
    )

    if @trade_request_item.save
      render json: @trade_request_item, status: :created, location: @trade_request_item
    else
      puts 'failed'
      render json: @trade_request_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @item.destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def trade_request_item_params
    params.require(:trade_request_item).permit(:id, :trade_request_id, :item_id, :locked, :amount)
  end
end
