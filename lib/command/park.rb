# Class to control the park command
class Park < Home
  def execute(args=[])
      reg_number = args[0] # Registration number of the car to be parked
      color = args[1] # Color of the car to be parked
      @controller.create_car_and_park(reg_number, color)
  end
end
