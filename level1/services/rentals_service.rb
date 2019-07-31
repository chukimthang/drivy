require 'date'

class RentalsService
  # return rental price of rental item
  def self.rental_price_item rental, car
    start_time = DateTime.parse(rental[:start_date])
    end_time = DateTime.parse(rental[:end_date])
    time_price = (end_time - start_time + 1).to_i * car[:price_per_day].to_i
    instance_price = rental[:distance].to_i * car[:price_per_km].to_i
    rental_price = time_price + instance_price
  end
end
