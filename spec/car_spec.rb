require 'spec_helper'

RSpec.describe Car do
  describe 'class attributes' do
    it 'should assign and get colour, reg_num, parking_slot' do
      car = Car.new('DL-6S-2018', 'red')

      car.parking_slot = '5'

      expect(car.colour).to eq('red')
      expect(car.reg_num).to eq('DL-6S-2018')
      expect(car.parking_slot).to eq('5')
    end
  end
end
