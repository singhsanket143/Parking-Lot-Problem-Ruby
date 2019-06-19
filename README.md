# Parking lot problem implemented in Ruby

Instructions to execute the project:

- Install Dependencies and Run Unit Tests

```
bin/setup
```

## Shell Script approach:

- Intractive Mode :

```
bin/parking_lot
```

- file input mode

```
bin/parking_lot input.txt
```

## Ruby command approach :

- Intractive Mode:

```
ruby main.rb
```

- File Input Mode:

```
ruby main.rb input.txt
```

## Application Explanation/flow

- main.rb is the root file of the app which initializes the whole project and handles all the inputs from the user either through reading file or intractive mode's input.
- car.rb and parking_slot.rb are classes which are interacting with controller.rb for saving their instances in Controller's parking_slots[].
- controller.rb is the file which acts as a controller and contains all required methods for making this app functional and interactive.
- ./lib/commands contains all the classes for specific terminal commands for the project.

![Result](snaps/1.png?raw=true "Title")
