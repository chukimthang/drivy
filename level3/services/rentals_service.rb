require 'date'

class RentalsService
   def self.rental_price_item rental, car
    start_time = DateTime.parse(rental[:start_date])
    end_time = DateTime.parse(rental[:end_date])
    day = (end_time - start_time + 1).to_i
    time_price = time_price day, car
    intance_price = rental[:distance].to_i * car[:price_per_km].to_i
    rental_price = time_price + intance_price
  end

   def self.rental_item rental_price, rental
    commission = 30 * rental_price / 100
    insurance_fee = commission / 2
    start_time = DateTime.parse(rental[:start_date])
    end_time = DateTime.parse(rental[:end_date])
    assistance_fee = (end_time - start_time + 1).to_i * 100
    drivy_fee = commission - insurance_fee - assistance_fee
    rental_item = {
      id: rental[:id],
      price: rental_price,
      commission: {
        insurance_fee: insurance_fee,
        assistance_fee: assistance_fee,
        drivy_fee: drivy_fee
      }
    }
  end
  
  private

  def self.time_price day, car
    time_price = car[:price_per_day]

    case 
    when (2..4) === day
      time_price += (day - 1) * discount(10, car[:price_per_day])
    when (5..10) === day
      time_price += 3 * discount(10, car[:price_per_day])
      time_price += (day - 4) * discount(30, car[:price_per_day])
    when day > 10
      time_price += 3 * discount(10, car[:price_per_day]) 
      time_price += 6 * discount(30, car[:price_per_day]) 
      time_price += (day - 10) * discount(50, car[:price_per_day])
    else
      time_price = car[:price_per_day].to_i * day
    end

    return time_price
  end

  def self.discount percent, number
    number.to_i - percent * number.to_i / 100
  end
end
