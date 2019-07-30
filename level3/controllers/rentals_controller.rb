require './models/car.rb'
require './services/rentals_service.rb'

class RentalsController
  def self.rental_price
    cars = Car.list_data
    expecte_rentals = {rentals: []} 

    cars.each do |car|
      car[:rentals].each do |rental|
        rental_price = RentalsService.rental_price_item(rental, car)
        rental_item = RentalsService.rental_item(rental_price, rental)
        expecte_rentals[:rentals] << rental_item
      end
    end
    
    return expecte_rentals
  end
end
