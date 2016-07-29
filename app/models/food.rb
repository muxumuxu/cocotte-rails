class Food < ApplicationRecord
  belongs_to :food_category
  belongs_to :food_risk, optional: true
end
