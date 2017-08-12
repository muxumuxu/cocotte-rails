# == Schema Information
#
# Table name: food_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order      :integer
#  image      :string
#

class FoodCategory < ApplicationRecord
  has_many :foods

  validates :name, presence: true
end
