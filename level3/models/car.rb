class Car
  
  # return array car with rental item
  def self.all
    begin
      data = File.open("./data/input.json") {|io| io.read}
      list_hash_data = data.empty? ? [] : eval(data) 
      list_cars = list_hash_data[:cars]
      list_rentals = list_hash_data[:rentals]
      array_car = []

      list_cars.each do |car|
        rental_of_car = {rentals: []}
        rental_of_car[:rentals] = list_rentals.select{|r| r[:car_id] == car[:id]}
        car_item = car.merge!(rental_of_car)
        array_car << car_item
      end
    rescue
      array_car = []
    end
  end
end
