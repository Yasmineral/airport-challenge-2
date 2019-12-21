require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  describe "#land" do
    it "can land a plane" do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end
  end
end