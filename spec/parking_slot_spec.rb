require 'spec_helper'

RSpec.describe ParkingSlot do
    describe 'class attributes' do
      it 'should assign and get car and slot_num' do
        parking_slot = ParkingSlot.new(5)
        car = Car.new('GJ-19-2018', 'red')
  
        parking_slot.car = car
  
        expect(parking_slot.car.colour).to eq('red')
        expect(parking_slot.car.reg_num).to eq('GJ-19-2018')
        expect(parking_slot.slot_num).to eq(5)
      end
    end
end
  