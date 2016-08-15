class AddOrderToFoodCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :food_categories, :order, :integer
  end
end
