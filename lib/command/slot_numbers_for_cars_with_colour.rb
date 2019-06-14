# Class to control the slot_numbers_for_cars_with_colour command
class SlotNumbersForCarsWithColour < Home

    def execute(args=[])
        color = args[0] # Color of the cars whose slots are supposed to be extracted
        @controller.slot_numbers_for_cars_with_colour(color)
    end

end
