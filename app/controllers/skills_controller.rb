# frozen_string_literal: true

require 'faker'

class SkillsController < ApplicationController
  # GET /skills
  def index
    @skills = Skill.all

    render json: @skills
  end

  # GET /skills/1
  def show
    @skill = Skill.find_by(id: params[:id])
    render json: @skill
  end

  # POST /skills
  def create
    @skill = Skill.new(user_id: params[:user_id], title: params[:title], subtitle: params[:subtitle], description: params[:description], worth_rating: params[:worth_rating], image: Faker::LoremFlickr.image, session_time: params[:session_time])

    if @skill.save
      render json: @skill, status: :created, location: @skill
    else
      puts 'failed'
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @skill.update(skill_params)
      render json: @skill
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

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
  def skill_params
    params.require(:skill).permit(:id, :user_id, :title, :subtitle, :description, :worth_rating, :image, :session_time)
  end
end
