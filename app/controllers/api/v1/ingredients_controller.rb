class Api::V1::IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new(params[:ingredient])
  end

  def create
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      flash[:success] = "Ingredient successfully created"
      redirect_to @ingredient
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  

  # add stuff to handle searching for custom ingredient in DB?

  # add find_by name which returns ingredient
  
end