# Class to control the status command
class Status < Home

  def execute(args = [])
      @controller.status
  end
end
