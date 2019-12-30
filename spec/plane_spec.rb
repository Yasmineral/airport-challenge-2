require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#take_off' do
    it 'raises an error if already flying' do
      expect { plane.take_off }.to raise_error "Plane cannot take-off: already flying"
    end
  end
  describe "#airport" do
    it "raises an error if already flying" do
      expect { plane.airport }.to raise_error "Plane not in airport: already flying"
    end
  end
end