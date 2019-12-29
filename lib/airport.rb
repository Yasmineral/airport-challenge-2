class Airport
  attr_accessor :planes

  def initialize(capacity)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land plane: airport full" if full?
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off: plane is not at the airport" unless at_airport?(plane)
    @planes.delete(plane)
  end

  private
  def at_airport?(plane)
    @planes.include?(plane)
  end

  def full?
    @planes.length >= @capacity
  end
end