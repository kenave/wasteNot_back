class Api::V1::IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  # add stuff to handle searching for custom ingredient in DB?

  # add find_by name which returns ingredient
  
end