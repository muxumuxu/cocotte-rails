Rails.application.routes.draw do
  root to: "foods#index"
  resources :food_risks
  resources :foods
  resources :food_categories
end
