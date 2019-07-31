require './controllers/rentals_controller.rb'
require 'json'

rental_price = RentalsController.new.rental_price
expected_rentals = rental_price.to_json

f = File.open("./data/expected_output.json", "w")
f.write(expected_rentals)
f.close 
