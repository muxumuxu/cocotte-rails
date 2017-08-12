# == Schema Information
#
# Table name: food_risks
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FoodRisk < ApplicationRecord
  has_many :foods

  validates :name, presence: true
end
