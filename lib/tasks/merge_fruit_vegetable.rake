namespace :merge_foods do
  desc "Merge foods from category Vegetable to category Fruits & Vegetable"
  task merge_foods: :environment do
    # Légumes: 11, 'legumes'
    # Fruit & Légumes: 3, 'Fruits & Légumes'
    vegetable_foods = Food.where(:food_category_id => 11).all

    vegetable_foods.each do |food|
      food.food_category_id = 3
      food.save

      puts "#{food.name} patched"
    end

    unless FoodCategory.find_by_id(11).nil?
      FoodCategory.destroy(11)
      puts "Category with id 11 deleted"
    end
  end
end
