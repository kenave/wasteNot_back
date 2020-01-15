class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :quantity_type
      t.string :category
      t.string :api_id # spoonacular API
      t.string :brand

      t.timestamps
    end
  end
end
