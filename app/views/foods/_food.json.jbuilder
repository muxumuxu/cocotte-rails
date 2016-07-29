json.extract! food, :id, :name, :info, :danger, :created_at, :updated_at
json.category food.food_category.name
json.risk food.food_risk
json.url food_url(food, format: :json)
