class AddImageToFoodCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :food_categories, :image, :string
  end
end
