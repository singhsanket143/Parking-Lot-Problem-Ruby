# Class to control the create_parking_lot command
class CreateParkingLot < Home

  def execute(args = [])
    capacity = args[0] # Capacity of the parking lot
    @controller.create_parking_lot(capacity)
  end
  
end
