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

require 'test_helper'

class FoodCategoryTest < ActiveSupport::TestCase
  should 'have a valid factory' do
    assert FactoryGirl.build(:food_category).valid?
  end
end
