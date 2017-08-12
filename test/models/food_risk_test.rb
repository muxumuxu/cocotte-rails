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

require 'test_helper'

class FoodRiskTest < ActiveSupport::TestCase
  should 'have a valid factory' do
    assert FactoryGirl.build(:food_risk).valid?
  end
end
