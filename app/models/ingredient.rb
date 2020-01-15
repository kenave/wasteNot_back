class Ingredient < ApplicationRecord
  has_many :user_ingredients
  has_many :users, through: :user_ingredients

  def find_by_name(name)
    ingredient = Ingredient.find_by(name: name)
  end

  def find_or_create_by_name_and_measurement(name, measurement)
    ingredient = Ingredient.find_or_create_by(name: name, measurement: measurement)
  end
end
