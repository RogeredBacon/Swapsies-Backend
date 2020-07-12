# frozen_string_literal: true

require 'faker'

class ItemsController < ApplicationController
  # GET /items
  def index
    @items = Item.all

    render json: @items
  end

  # GET /items/1
  def show
    @item = Item.find_by(id: params[:id])
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(user_id: params[:user_id], title: params[:title], subtitle: params[:subtitle], description: params[:description], worth_rating: params[:worth_rating], image: Faker::LoremFlickr.image, amount: params[:amount])

    if @item.save
      render json: @item, status: :created, location: @item
    else
      puts 'failed'
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @item.update(items_and_services_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @item.destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:id, :user_id, :title, :subtitle, :description, :worth_rating, :image, :amount)
  end
end
