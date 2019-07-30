require './controllers/rentals_controller.rb'
require 'json'

rental_price = RentalsController.rental_price
expecte_rentals = rental_price.to_json

f = File.open("./data/expected_output.json", "w")
f.write(expecte_rentals)
f.close 
