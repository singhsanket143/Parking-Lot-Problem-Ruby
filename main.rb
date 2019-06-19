#!/usr/bin/env ruby
# Class to initialize the whole project
require_relative 'lib/command/home'
Dir["./lib/*.rb"].each {|file| require_relative file }
Dir["./lib/command/*.rb"].each {|file| require file }
class Main

    #C Construtor
    def initialize(path = 0)
        @path = path # Input path
        @controller = Controller.new # initialize the controller
        @commands_available = { # Available Commands to be executed
          'create_parking_lot' => CreateParkingLot.new(@controller), # Creating the new CreateParkingLot Object for the corresponfing command
          'leave' => Leave.new(@controller), # Creating the new Leave Object for the corresponfing command
          'park' => Park.new(@controller), # Creating the new Park Object for the corresponfing command
          'registration_numbers_for_cars_with_colour' => RegistrationNumbersForCarsWithColour.new(@controller), # Creating the new RegistrationNumbersForCarsWithColour Object for the corresponfing command
          'slot_number_for_registration_number' => SlotNumberForRegistrationNumber.new(@controller),  # Creating the new SlotNumberForRegistrationNumber Object for the corresponfing command
          'slot_numbers_for_cars_with_colour' => SlotNumbersForCarsWithColour.new(@controller), # Creating the new SlotNumbersForCarsWithColour Object for the corresponfing command
          'status' => Status.new(@controller)
        }
    end

    # Function to execute commands from file input mode or command mode
    def read_and_execute(inp)
        args = inp.split(' ') # Split the input by space
        cmd_name = args[0] # First argument of the command name
        cmd_args = args[1..inp.length] # Second argument is the argument of the commands
        @commands_available[cmd_name].execute(cmd_args)
    end

    # Function to start the Main class execution depending on file or normal input
    def start(file = '')
        case @path 
            when 0 # Command Mode
                while true
                    command = gets().strip # Get the input command
                    break if command == 'exit' #exit to stop
                    read_and_execute(command)
                end
            when 1  #file mode
                commands = File.readlines(file) # Read file contents
                commands.each {|command| read_and_execute(command.strip)}
            else # Unknown Input Mode
                puts 'Unknown Input Mode!'
        end
    end
end


file = ARGV[0] # Take the file as input from command line arguments
unless file.nil? # If input from command line argument is a file
    Main.new(1).start(file)
else  # If input fromcommand line argument if not a file
    Main.new(0).start
end
