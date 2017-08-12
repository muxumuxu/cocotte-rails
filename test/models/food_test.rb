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

require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  should 'have a valid factory' do
    assert FactoryGirl.build(:food).valid?
  end
end
