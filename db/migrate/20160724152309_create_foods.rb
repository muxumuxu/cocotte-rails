class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :info
      t.integer :food_category_id
      t.string :risk
      t.integer :danger

      t.timestamps
    end
  end
end
