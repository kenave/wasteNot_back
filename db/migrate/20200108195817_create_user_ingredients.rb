class CreateUserIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :user_ingredients do |t|
      t.integer :user_id
      t.integer :ingredient_id
      t.float :quantity
      t.string :measurement_type
      t.date :date_purchased
      t.date :expiration_date

      t.timestamps
    end
  end
end