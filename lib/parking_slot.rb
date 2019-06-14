# Class to control initialization and properties of a ParkingSlot
class ParkingSlot
    # Constructor
    def initialize(slot_num)
        @slot_num = slot_num  # Slot Number Of Parking Slot
    end

    attr_accessor :slot_num,  :car
end
