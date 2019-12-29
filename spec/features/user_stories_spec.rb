require 'airport'
require 'plane'
require 'weather'

describe 'User Stories' do
  let(:airport) { Airport.new(20, weather) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context "when weather is not stormy" do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end
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
    it "does not allow planes to land when airport is full" do
      20.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
    end
  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
    it "airports have a default capacity that can be overridden" do
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
    end
  end
  
  context "when stormy" do
    before do
      allow(weather).to receive(:stormy?).and_return true
    end
    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent takeoff when weather is stormy
    it "does not allow planes to takeoff" do
      expect {airport.take_off(plane) }.to raise_error "Cannot take-off plane: weather is too stormy"
    end
    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when weather is stormy 
    it "does not allow planes to land" do
      expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is too stormy"
    end
  end
end

