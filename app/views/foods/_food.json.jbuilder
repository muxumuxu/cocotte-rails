json.extract! food, :id, :name, :food_category_id, :info, :risk, :danger, :created_at, :updated_at
json.url food_url(food, format: :json)