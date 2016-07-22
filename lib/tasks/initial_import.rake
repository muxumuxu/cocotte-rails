require 'json'
require 'net/http'

namespace :initial_import do
  desc "Import data from http://www.alimentation-grossesse.com/"
  task import_foods: :environment do

    file = File.read('./lib/assets/foods.json')
    raw_foods = JSON.parse(file)

    raw_foods.map do |raw_food|

      raw_name = raw_food["label"]
      raw_value = raw_food["value"]

      puts "Checking for #{raw_name} (#{raw_value})"

      uri = URI.parse("http://www.alimentation-grossesse.com/php/load_al.php")
      http = Net::HTTP.new(uri.host, uri.port)
      headers = {
        "Content-Type" => "application/x-www-form-urlencoded",
        "Accept" => "application/json"
      }
      request = Net::HTTP::Post.new(uri.request_uri, headers)
      request.body = "valuetos=#{raw_value}"
      response = http.request(request)

      puts "HTTP Response: \n\tcode: #{response.code}\n\tbody: #{response.body}"

      if response.code.to_i == 200
        json = JSON.parse(response.body)

        puts "(#{raw_name}, #{raw_value}) = #{json}"

        category_name = json["Categorie"]

        category = FoodCategory.find_by_name(category_name) || FoodCategory.new({ :name => category_name })

        food = Food.new
        food.food_category = category
        food.name = json["Aliment"].to_s != '' ? json["Aliment"].to_s : raw_name
        food.info = json["Info"]
        food.risk = json["Risque"]
        food.danger = json["Interdit"] == "1"
        food.save
      end
    end
  end
end
