namespace :merge_categories do
  desc "Merge foods from category Vegetable to category Fruits & Vegetable"
  task merge_vegetables: :environment do
    from = 11
    to = 3

    vegetable_foods = Food.where(:food_category_id => from).all

    vegetable_foods.each do |food|
      food.food_category_id = to
      food.save

      puts "#{food.name} patched"
    end
    
    unless FoodCategory.find_by_id(from).nil?
      FoodCategory.destroy(from)

      puts "Category with id 8 deleted"
    end
  end

  desc "Merge foods from category boisson to category Boisson"
  task merge_drinks: :environment do
    from = 8
    to = 15

    lower_foods = Food.where(:food_category_id => from).all

    lower_foods.each do |food|
      food.food_category_id = to
      food.save

      puts "#{food.name} patched"
    end

    unless FoodCategory.find_by_id(from).nil?
      FoodCategory.destroy(from)

      puts "Category with id 8 deleted"
    end
  end
end
