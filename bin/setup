#!/bin/bash
name=rspec
installed=`gem list -i $name -v "$version"`

if [ $installed = 'true' ]; then
  echo gem exists: $name $version
else
  echo gem install $name 
fi

echo 'Executing unit tests for Car.rb'
rspec 'spec/car_spec.rb'

echo 'Executing unit tests for ParkingSlot.rb'
rspec 'spec/parking_slot_spec.rb'

echo 'Executing unit tests for Controller.rb'
rspec 'spec/controller_spec.rb'