namespace :migrate do
  task migrate_risks: :environment do
    foods = Food.all
    foods.each do |food|
      puts "#{food.id}: #{food.risk}"

      name = food.risk.downcase
        .gsub(".", "")
        .gsub("aucun interdit", "")
        .gsub("aucun", "")
        .strip

      next if name.nil? || name.to_s.strip.length == 0

      risk = FoodRisk.find_by_name(name)
      if risk.nil?
        risk = FoodRisk.new
        risk.name = name
        risk.save
      end

      food.food_risk_id = risk.id
      food.save
    end

    # capitalize all risks
    FoodRisk.all.each do |risk|
      risk.name.capitalize!
      risk.save
    end
  end

  task migrate_infos: :environment do
    prefix = "aucun"
    foods = Food.where("lower(info) LIKE :prefix", prefix: "#{prefix}%").all
    foods.each do |food|
      food.info = nil
      food.save!
    end
  end
end
