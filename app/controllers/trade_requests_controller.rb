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

  def user_trades
    @user = User.find_by(id: params[:id])
    @initiating_trades = TradeRequest.all.where(initiating_user_id: @user.id).order(updated_at: :desc)
    @receiving_trades = TradeRequest.all.where(receiving_user_id: @user.id).order(updated_at: :desc)
    render json: @initiating_trades + @receiving_trades
  end

  def goods
    @user = User.find_by(id: params[:user])
    @requests_items = TradeRequestItem.all.where(trade_request_id: params[:id]).order(updated_at: :desc)
    @requests_skills = TradeRequestSkill.all.where(trade_request_id: params[:id]).order(updated_at: :desc)
    @items = []
    @skills = []
    @requests_items.map do |e|
      @item = {}
      @item['id'] = Item.find_by(id: e.item_id).id
      @item['title'] = Item.find_by(id: e.item_id).title
      @item['image'] = Item.find_by(id: e.item_id).image
      @item['user_id'] = Item.find_by(id: e.item_id).user_id
      @item['amount'] = Item.find_by(id: e.item_id).amount
      @item['total'] = e.amount
      puts @item
      @items << @item
    end

    @requests_skills.map do |e|
      @skill = {}
      @skill['id'] = Skill.find_by(id: e.skill_id).id
      @skill['title'] = Skill.find_by(id: e.skill_id).title
      @skill['image'] = Skill.find_by(id: e.skill_id).image
      @skill['user_id'] = Skill.find_by(id: e.skill_id).user_id
      @skill['total'] = e.amount
      puts @skill
      @skills << @skill
    end
    @goods = @skills + @items
    @buy = []
    @sell = []
    @goods.map do |e|
      if e['user_id'] == @user.id
        @sell << e
      else @buy << e end
    end
    render json: [@sell, @buy]
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
