require './models/car.rb'
require './services/rentals_service.rb'

class RentalsController
  def rental_price
    cars = Car.all
    expected_rentals = {rentals: []} 

    cars.each do |car|
      expected_rentals[:rentals] += car[:rentals].map{|r|
        RentalsService.rental_item(RentalsService.rental_price_item(r, car), r)
      }
    end
    return expected_rentals
  end
end
