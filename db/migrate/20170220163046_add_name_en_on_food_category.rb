class AddNameEnOnFoodCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :food_categories, :name_en, :string
  end
end
