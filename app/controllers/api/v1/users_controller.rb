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
    user_ingredient = UserIngredient.create("user_id": i["user"].to_i, "ingredient_id": ingredient.id, "quantity": i["quantity"], "original_quantity": i["quantity"], "measurement_type": i["measurementType"], "date_purchased": i["datePurchased"], "expiration_date": i["expirationDate"])
    ingredients_hash = user.get_inventory
    render json: ingredients_hash
  end

  def change_quantity
    user = User.find(params[:user_id])
    ui = UserIngredient.find(params[:ing_id])
    # puts "original quantity: " + "#{ui.original_quantity}"
    # puts "multiplier: " + "#{params["quantity"].to_f / 100.0}"
    puts "new quantity will be: " + "#{ui.original_quantity * (params["quantity"].to_f / 100.0)}"
    ui.quantity = ui.original_quantity * params["quantity"].to_f / 100.0
    ui.save
    # puts ui.quantity
    ingredients_hash = user.get_inventory
    render json: ingredients_hash
  end

  def delete_ingredient
    user = User.find(params[:user_id])
    ui = UserIngredient.find(params[:ing_id])
    ui.destroy
    ingredients_hash = user.get_inventory
    render json: ingredients_hash
  end

end