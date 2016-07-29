class Food < ApplicationRecord
  enum danger: [ :empty, :care, :avoid ]

  belongs_to :food_category
  belongs_to :food_risk, optional: true
end
