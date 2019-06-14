# Class to control initialization and properties of a Car
class Car
    #constructor
    def initialize(reg_num, colour)
          @reg_num = reg_num # Registration Number Of Car
          @colour = colour # Color Of Car
    end

    attr_accessor :reg_num, :colour, :parking_slot
end
