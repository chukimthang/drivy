require 'date'

class RentalsService
   def self.rental_price_item rental, car
    start_time = DateTime.parse(rental[:start_date])
    end_time = DateTime.parse(rental[:end_date])
    time_price = (end_time - start_time + 1).to_i * car[:price_per_day].to_i
    intance_price = rental[:distance].to_i * car[:price_per_km].to_i
    rental_price = time_price + intance_price
  end
end
