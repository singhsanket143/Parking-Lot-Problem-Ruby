# Controller class controls all the commands and handling for the parking slots
class Controller
    # Constructor
    def initialize
      @parking_lot_capacity = 0 # Data member to store the capacity of the overall parking lot
      @parking_slots = [] # Data member to store the parking slots in the overall parking lot
      @registered_cars = {} # Data member to store the already registered cars with the current parking lot
    end

    # This function will create a new parking lot with Capacity amount of Parking slots
    def create_parking_lot(capacity)
        if (capacity.to_i < 0) 
            puts "Invalid capacity for the parking lot. Please enter a valid capacity"
            return
        end
        @parking_lot_capacity = capacity # Initialize the parking lot with the input capacity
        capacity.to_i.times do |i|
            @parking_slots << ParkingSlot.new(i+1) # Append a new Parking Slot to the overal Parking lot
        end

        puts "Successfully created a new parking lot with #{capacity} slots"
    end

    # This fucntion will park a car to an available nearest slot
    def create_car_and_park(reg_num, color)
        slot = @parking_slots.find{|slot| slot.car.nil?} # Finding the first empty slot from the Parking lot
        if slot.nil? # Check if slot is not empty
            puts "Sorry, parking lot is full"
            return
        end
        puts "Allocated slot number: #{slot.slot_num}" # If slot is empty then allocate a new slot
        if not @registered_cars[reg_num].nil? # Check if car with given registration number already exist in the registered cars database
            slot.car = @registered_cars[reg_num] # Make an entry to store the car in the parking slot
            @registered_cars[reg_num].parking_slot = slot # Make an entry to store the slot number corresponding to the current car
        else  # If car is not already registered
            car = Car.new(reg_num, color) # Create a new car entry 
            slot.car = car # Make an entry to store the car in the parking slot
            car.parking_slot = slot # Make an entry to store the slot number corresponding to the current car
            @registered_cars[reg_num] = car # Add the new car in the database
        end
    end

    # Removes a car from the slot it earlier occupied
    def leave_parking_slot(slot_num)
        if(slot_num.to_i > @parking_lot_capacity.to_i) 
            puts "Slot number doesn't exist. Please enter a valid slot to leave"
            return
        end
        puts "Slot number #{slot_num} is free"
        @parking_slots[slot_num - 1] = ParkingSlot.new(slot_num) # Remove the entry of the car from the parking slot
    end

    # This function  gives the overall current situation of the parking slot
    def status_of_parking_lot
        puts "Slot No. \t Registration No. \t Color"
        @parking_slots.each do |slot| # Iterate over all the slots
            unless slot.car.nil? # Check if slot is not empty
                puts "#{slot.slot_num} \t\t #{slot.car.reg_num} \t\t #{slot.car.colour}"
            end
        end
    end

    # This function prints the registration numbers of all the cars corresponding to a given color
    def registration_numbers_for_cars_with_colour(colour)
        puts @parking_slots.map{|slot| slot.car.reg_num if slot.car.colour == colour}.compact.join(', ')
    end
    
    # This function prints the slot numbers for the cars corresponding to a given color
    def slot_numbers_for_cars_with_colour(colour)
        puts @parking_slots.map{|slot| slot.slot_num if slot.car.colour == colour}.compact.join(', ')
    end
    
    # This function prints the slot numbers of all the cars corresponding to a given registration number
    def slot_number_for_registration_number(reg_num)
        slot = @parking_slots.find{|slot| (not slot.car.nil? and slot.car.reg_num == reg_num)}
        puts slot.nil? ?  'Not found' : slot.slot_num
    end

    attr_accessor :parking_lot_capacity, :parking_slots
end