class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off: plane is not at the airport' unless at_airport?(plane)
    @planes.delete(plane)
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end
end