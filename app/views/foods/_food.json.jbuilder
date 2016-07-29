json.extract! food, :id, :name, :info, :food_category_id, :food_risk_id, :danger, :created_at, :updated_at
json.url food_url(food, format: :json)
