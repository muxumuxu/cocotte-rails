require 'test_helper'

class FoodRisksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_risk = food_risks(:one)
  end

  test "should get index" do
    get food_risks_url
    assert_response :success
  end

  test "should get new" do
    get new_food_risk_url
    assert_response :success
  end

  test "should create food_risk" do
    assert_difference('FoodRisk.count') do
      post food_risks_url, params: { food_risk: { name: @food_risk.name, url: @food_risk.url } }
    end

    assert_redirected_to food_risk_url(FoodRisk.last)
  end

  test "should show food_risk" do
    get food_risk_url(@food_risk)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_risk_url(@food_risk)
    assert_response :success
  end

  test "should update food_risk" do
    patch food_risk_url(@food_risk), params: { food_risk: { name: @food_risk.name, url: @food_risk.url } }
    assert_redirected_to food_risk_url(@food_risk)
  end

  test "should destroy food_risk" do
    assert_difference('FoodRisk.count', -1) do
      delete food_risk_url(@food_risk)
    end

    assert_redirected_to food_risks_url
  end
end
