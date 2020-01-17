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

  def add_ingredient
    user = User.find(params[:ingredient][:user])
    i = params[:ingredient]
    puts "params: #{i}"
    ingredient = Ingredient.find_or_create_by("name": i["name"])
    user_ingredient = UserIngredient.create("user_id": i["user"].to_i, "ingredient_id": ingredient.id, "quantity": i["quantity"], "quantity_type": i["quantityType"], "date_purchased": i["datePurchased"], "expiration_date": i["expirationDate"])
    ingredients_hash = user.get_inventory
    render json: ingredients_hash
  end

end