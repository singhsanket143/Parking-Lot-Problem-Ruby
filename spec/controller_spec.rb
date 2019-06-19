require 'spec_helper'

RSpec.describe Controller do
    describe '#create_parking_lot' do
      it 'should create parking lots of provided capacity' do
        controller = Controller.new
  
        expect(controller.parking_lot_capacity).to eq(0)
        expect(controller.parking_slots.length).to eq(0)
  
        controller.create_parking_lot(6)

        expect(controller.parking_lot_capacity).to eq(6)
        expect(controller.parking_slots.length).to eq(6)
        expect(controller.parking_slots.first).to be_an_instance_of(ParkingSlot)
      end
    end
  
    describe '#create_car_and_park' do
      it 'should create a car and park car in the first available slot' do
        controller = Controller.new
        controller.create_parking_lot(5)
  
        expect(controller).to receive(:puts).with('Allocated slot number: 1')
        controller.create_car_and_park('test-num-A','black')
  
        expect(controller.parking_slots.first.car.reg_num).to eq('test-num-A')
        expect(controller.parking_slots.first.car.colour).to eq('black')
        expect(controller.parking_slots.last.car).to be_nil
      end
      it 'should not create and park car if parking full' do
        controller = Controller.new
  
        controller.create_parking_lot(1)
  
        expect(controller).to receive(:puts).with('Allocated slot number: 1')
        controller.create_car_and_park('num-A','black')
  
        expect(controller).to receive(:puts).with('Sorry, parking lot is full')
        controller.create_car_and_park('KA-01-1235','black')
      end
    end
  
    describe '#leave_parking_slot' do
      it 'should free the provided parking slot' do
        controller = Controller.new
  
        controller.create_parking_lot(1)
        expect(controller.parking_slots.last.car).to be_nil
  
        controller.create_car_and_park('test-num-A','black')
        expect(controller.parking_slots.last.car).to_not be_nil
  
        controller.leave_parking_slot(1)
        expect(controller.parking_slots.last.car).to be_nil
      end
    end
  
    describe '#data fetch and print' do
      it 'should fetch and print registration_numbers_for_cars_with_colour' do
        controller = prefilled_controller
  
        expect(controller).to receive(:puts).with('test-num-B, test-num-D')
  
        controller.registration_numbers_for_cars_with_colour('silver')
      end
  
      it 'should fetch and print slot_numbers_for_cars_with_colour' do
        controller = prefilled_controller
  
        expect(controller).to receive(:puts).with('1, 3')
        controller.slot_numbers_for_cars_with_colour('black')
      end
  
      it 'should fetch and print slot_number_for_registration_number' do
        controller = prefilled_controller
        expect(controller).to receive(:puts).with(2)
        controller.slot_number_for_registration_number('test-num-B')
      end
  
      it 'should fetch and print Not Found when slot_number_for_registration_number is not present' do
        controller = prefilled_controller
  
        expect(controller).to receive(:puts).with('Not found')
        controller.slot_number_for_registration_number('some-test-num')
      end
  
      it 'should fetch and print the status of the parking lot' do
        controller = prefilled_controller
  
        expect(controller).to receive(:puts).with("Slot No. \t Registration No. \t Color")
        expect(controller).to receive(:puts).with("1 \t\t test-num-A \t\t black")
        expect(controller).to receive(:puts).with("2 \t\t test-num-B \t\t silver")
        expect(controller).to receive(:puts).with("3 \t\t test-num-C \t\t black")
        expect(controller).to receive(:puts).with("4 \t\t test-num-D \t\t silver")
  
        controller.status_of_parking_lot
      end
    end
  
    def prefilled_controller
      controller = Controller.new
      controller.create_parking_lot(4)
  
      controller.create_car_and_park('test-num-A','black')
      controller.create_car_and_park('test-num-B','silver')
      controller.create_car_and_park('test-num-C','black')
      controller.create_car_and_park('test-num-D','silver')
  
      return controller
    end
  end
  