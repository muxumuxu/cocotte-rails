require 'json'
require 'net/http'

namespace :initial_import do
    desc "Import data from http://www.alimentation-grossesse.com/"
    task import: :environment do

        file = File.read('./lib/assets/foods.json')
        raw_foods = JSON.parse(file)

        raw_foods.map do |raw_food|

            raw_name = raw_food["label"]
            raw_value = raw_food["value"]

            uri = URI.parse("https://www.alimentation-grossesse.com/php/load_al.php")
            request = Net::HTTP::Post.new(uri)
            request.content_type = "application/x-www-form-urlencoded; charset=UTF-8"
            request["Accept"] = "application/json, text/javascript, */*; q=0.01"
            request.set_form_data("valuetos" => "347")
            req_options = { use_ssl: uri.scheme == "https" }

            response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
                http.request(request)
            end

            puts "Looking for #{raw_name}(#{raw_value}): #{response.code}"

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
                food.danger = json["Interdit"].to_i
                food.save!

                puts "#{food.id} food saved!"
            end
        end
    end
end
