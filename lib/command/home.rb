class Home
  # Constructor
  def initialize(controller)
    @controller = controller
  end

  # Function to be executed if command is not found
  def execute(args = [])
    raise '404: command not found'
  end
end
