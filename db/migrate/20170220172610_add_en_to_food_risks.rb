class AddEnToFoodRisks < ActiveRecord::Migration[5.0]
  def change
    add_column :food_risks, :name_en, :string
  end
end
