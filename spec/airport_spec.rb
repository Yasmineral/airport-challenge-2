require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  describe "#land" do
    it "instructs a plan to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end  
    it "can land a plane" do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end
  end
  describe "#take_off" do
    it "can instruct a plane to take off" do
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end
    xit "raises an error when trying to take off a plane that's already in the air" do
      airport.take_off(plane)
      expect(airport.take_off(plane)).to raise_error "Cannot take off plane: plane already flying"
    end
  end
end
