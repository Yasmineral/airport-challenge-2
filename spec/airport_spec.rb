require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }
  describe "#land" do
    context "when weather is stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end
      it "does not allow planes to land" do
        expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is too stormy"
      end
    end
    context "when weather is not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end
      it "instructs a plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end  
      it "landed planes are stored at the airport" do
        airport.land(plane)
        expect(airport.planes).to eq [plane]
      end
    end
    context "when airport is full" do
      it "raises an error" do
        allow(airport).to receive(:stormy?).and_return false
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
      end
    end
  end

  describe "#take_off" do
    context "when not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end
      it "instructs a plane to take-off" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end 
      it "no longer stores plane at the airport" do
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
    context "when weather is stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end
      it "does not allow planes to take-off" do
        expect { airport.take_off(plane) }.to raise_error "Cannot take-off plane: weather is too stormy"
      end
    end
  end

  context "defaults" do
    let(:default_airport) { described_class.new }
    it "has a default capacity" do
      allow(default_airport).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error "Cannot land plane: airport full"
    end
  end
end
