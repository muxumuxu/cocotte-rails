class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :food_category_id
      t.text :info
      t.text :risk
      t.boolean :danger

      t.timestamps
    end
  end
end
