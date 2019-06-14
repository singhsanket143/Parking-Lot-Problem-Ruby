# Class to controle the slot_number_for_registration_number command
class SlotNumberForRegistrationNumber < Home

    def execute(args=[])
        reg_num = args[0] # Registration number of the car whose slot number is supposed to be extracted
        @controller.slot_number_for_registration_number(reg_num)
    end

end
