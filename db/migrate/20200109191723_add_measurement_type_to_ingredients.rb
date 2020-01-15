class AddMeasurementTypeToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :measurement_type, :string
  end
end
