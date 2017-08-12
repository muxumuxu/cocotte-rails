class RemoveNameEnOnModels < ActiveRecord::Migration[5.0]
  def change
    remove_column :foods, :name_en
    remove_column :food_categories, :name_en
    remove_column :food_risks, :name_en
  end
end
