# Class to control the leave command
class Leave < Home

  def execute(args=[])
      slot_num = args[0].to_i # Slot number to be left vacant
      @controller.leave_parking_slot(slot_num)
  end
end
