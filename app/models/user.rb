class User < ApplicationRecord
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  def get_inventory
    ingredients = self.ingredients.uniq # [{name, quantity type, category}]
    puts ingredients
    ingredients_hash = {}
    ingredients.each do |ingredient|
      user_ingredients = UserIngredient.where("user_id = ? AND ingredient_id = ?", self.id, ingredient.id)
      user_ingredients.each do |ui|
        if ingredients_hash[ingredient.name.downcase]
          ingredients_hash[ingredient.name.downcase].push({
            name: ingredient.name,
            id: ui.id.to_s,
            quantity: ui.quantity,
            measurement_type: ui.measurement_type,
            date_purchased: ui.date_purchased,
            expiration_date: ui.expiration_date
          })
        else
          ingredients_hash[ingredient.name.downcase] = [{
            name: ingredient.name,
            id: ui.id.to_s,
            quantity: ui.quantity,
            measurement_type: ui.measurement_type,
            date_purchased: ui.date_purchased,
            expiration_date: ui.expiration_date
          }]
        end
      end
    end
    ingredients_hash
  end

end
