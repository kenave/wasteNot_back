class Api::V1::UsersController < ApplicationController
  def ingredients
    user = User.find(params[:id])
    ingredients_hash = user.get_inventory
    render json: ingredients_hash
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def add_ingredients
    # user = User.find(params[:id])
    puts params["name"]
  end

end