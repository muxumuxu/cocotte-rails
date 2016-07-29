class AddFoodRiskIdToFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :food_risk_id, :integer
  end
end
