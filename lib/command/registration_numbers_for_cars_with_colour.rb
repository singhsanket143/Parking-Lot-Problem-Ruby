# Class to control registration_numbers_for_cars_with_colour command
class RegistrationNumbersForCarsWithColour < Home

    def execute(args=[])
        color = args[0] # Color of the cars whose registration number is supposed to get extracted
        @controller.registration_numbers_for_cars_with_colour(color)
    end

end
