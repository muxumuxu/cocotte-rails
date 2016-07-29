namespace :merge_categories do

  task merge: :environment do
    merge_cats(13, 6) # merge sea foods
    merge_cats(14, 1) # merge volailles
    merge_cats(2, 5)  # merge cheeses
    merge_cats(11, 3) # merge vegetables
    merge_cats(8, 15) # merge drinks
    merge_cats(19, 5) # merge eggs
    merge_cats(12, 17) # merge desserts

    # rename feculent category
    feculent = FoodCategory.find_by_id(18)
    feculent.name = "Féculents"
    feculent.save

    desserts = FoodCategory.find_by_id(17)
    desserts.name = "Desserts"
    desserts.save

    # capitalize all categories
    FoodCategory.all.each do |cat|
      cat.name.capitalize!
      cat.save
    end
  end

  def merge_cats(from, to)

    # switch legacy food category to new category
    foods = Food.where(:food_category_id => from).all
    foods.each do |food|
      food.food_category_id = to
      food.save

      puts "#{food.name} patched"
    end

    # destroy `from` category id
    unless FoodCategory.find_by_id(from).nil?
      FoodCategory.destroy(from)

      puts "Category with id #{from} deleted"
    end
  end
end
