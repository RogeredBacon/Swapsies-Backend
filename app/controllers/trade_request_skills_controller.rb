# frozen_string_literal: true

class TradeRequestSkillsController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]

  # GET /trade_requests_items
  def index
    @trade_request_skills = TradeRequestItem.all

    render json: @trade_request_skills
  end

  # GET /trade_requests/1
  def show
    @trade_request_skill = TradeRequestSkill.find_by(id: params[:id])
    render json: @trade_request_skill
  end

  # POST /trade_request
  def create
    @trade_request_skill = TradeRequestItem.new(trade_request_id: params[:trade_request_id], skills_id: params[:skills_id])

    if @trade_request_skill.save
      render json: @trade_request_skill, status: :created, location: @trade_request_skill
    else
      puts 'failed'
      render json: @trade_request_skill.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /users/1
  # def update
  #   if @user.update(user_params)
  #     render json: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /users/1
  def destroy
    @skill.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def trade_request_skills_params
    params.require(:trade_request_skills).permit(:id, :trade_request_id, :skills_id, :locked, :amount)
  end
end
