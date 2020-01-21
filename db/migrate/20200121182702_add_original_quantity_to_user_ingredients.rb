class AddOriginalQuantityToUserIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :user_ingredients, :original_quantity, :float, :after => "ingredient_id"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
