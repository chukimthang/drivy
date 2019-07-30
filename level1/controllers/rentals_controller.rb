require './models/car.rb'
require './services/rentals_service.rb'

class RentalsController
  def self.rental_price
    cars = Car.list_data
    expecte_rentals = {rentals: []} 

    cars.each do |car|
      car[:rentals].each do |rental|
        rental_price = RentalsService.rental_price_item(rental, car)
        expecte_rentals[:rentals] << {id: rental[:id], price: rental_price}
      end
    end
    
    return expecte_rentals
  end
end
