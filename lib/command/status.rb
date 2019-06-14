# Class to control the status command
class Status < Home

  def execute(args = [])
      @controller.status_of_parking_lot
  end
end
