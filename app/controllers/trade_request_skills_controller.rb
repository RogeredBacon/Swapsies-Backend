# frozen_string_literal: true

class TradeRequestSkillsController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]

  # GET /trade_requests_items
  def index
    @trade_request_skills = TradeRequestSkill.all

    render json: @trade_request_skills
  end

  # GET /trade_requests/1
  def show
    @trade_request_skill = TradeRequestSkill.find_by(id: params[:id])
    render json: @trade_request_skill
  end

  # POST /trade_request
  def create
    @trade_request_skill = TradeRequestSkill.new(trade_request_id: params[:trade_request_id], skill_id: params[:skill_id], locked: params[:locked], amount: params[:amount])

    if @trade_request_skill.save
      render json: @trade_request_skill, status: :created, location: @trade_request_skill
    else
      puts 'failed'
      render json: @trade_request_skill.errors, status: :unprocessable_entity
    end
  end

  def update
    if @trade_request_skill.update(trade_request_skill_params)
      render json: @trade_request_skill
    else
      render json: @trade_request_skill.errors, status: :unprocessable_entity
    end
end

  # DELETE /users/1
  def destroy
    @skill.destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def trade_request_skill_params
    params.require(:trade_request_skill).permit(:id, :trade_request_id, :skill_id, :locked, :amount)
  end
end
