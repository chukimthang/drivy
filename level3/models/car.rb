class Car
  def self.list_data
    data = File.open("./data/input.json") {|io| io.read}
    list_hash_data = eval(data)
    list_cars = list_hash_data[:cars]
    list_rentals = list_hash_data[:rentals]
    array_car = []

    list_cars.each do |car|
      rental_of_car = {rentals: []}
      list_rentals.each do |rental|
        if rental[:car_id] == car[:id]
          rental_of_car[:rentals] << rental
        end
      end
      car_item = car.merge!(rental_of_car)
      array_car << car_item
    end

    return array_car
  end
end
