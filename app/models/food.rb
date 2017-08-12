# == Schema Information
#
# Table name: foods
#
#  id               :integer          not null, primary key
#  name             :string
#  info             :text
#  food_category_id :integer
#  risk             :string
#  danger           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  food_risk_id     :integer
#  info_en          :string
#

class Food < ApplicationRecord
  enum danger: [ :empty, :care, :avoid ]

  belongs_to :food_category
  belongs_to :food_risk, optional: true
end
