class User < ApplicationRecord
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  def get_inventory
    ingredients = self.ingredients # [{name, quantity type, category}]
    ingredients_arr = []
    ingredients.each do |ingredient|
      user_ingredient = UserIngredient.find_by(user_id: self.id, ingredient_id: ingredient.id)
      ingredients_arr.push({
        id: user_ingredient.id.to_s,
        name: ingredient.name, 
        quantity_type: ingredient.quantity_type,
        measurement_type: ingredient.measurement_type,
        category: ingredient.category, 
        quantity: user_ingredient.quantity, 
        date_purchased: user_ingredient.date_purchased, 
        expiration_date: user_ingredient.expiration_date
      })
    end
    ingredients_arr
  end
end
