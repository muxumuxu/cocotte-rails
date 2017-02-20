json.extract! food, :id, :name, :info, :name_en, :info_en, :danger
json.category food.food_category
json.risk food.food_risk
json.url food_url(food, format: :json)
