require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }
  describe "#land" do
    it "instructs a plane to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end  
    it "landed planes are stored at the airport" do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end
    context "when airport is full" do
      it "raises an error" do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
      end
    end
  end

  describe "#take_off" do
    it "instructs a plane to take-off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end 
    it "planes are no longer at the airport" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end
    it "raises an error when trying to take off a plane that's already in the air" do
      airport.land(plane)
      airport.take_off(plane)
      expect{ airport.take_off(plane) }.to raise_error "Cannot take off: plane is not at the airport"
    end
  end

  context "defaults" do
    let(:default_airport) { described_class.new }
    it "has a default capacity" do
      Airport::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error "Cannot land plane: airport full"
    end
  end
end
