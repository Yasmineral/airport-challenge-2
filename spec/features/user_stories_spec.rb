require 'airport'
require 'plane'

describe 'User Stories' do
  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }
  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport
  it "so planes land at airports, instruct a plane to land" do
    expect { airport.land(plane) }.not_to raise_error
  end
  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport
  it "so planes take-off from airports, instruct a plane to take-off" do  
    airport.land(plane)
    expect { airport.take_off(plane) }.not_to raise_error
  end
  # and confirm that it is no longer at the airport
  it "planes that have taken off are no longer at the airport" do
    airport.land(plane)
    airport.take_off(plane)
    expect { airport.take_off(plane) }.to raise_error "Cannot take off: plane is not at the airport"
  end
  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when the airport is full 
  it "does not allow planes to land when the airport is full" do
    airport = Airport.new(20)
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
  end
end