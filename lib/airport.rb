require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise "Cannot land plane: weather is too stormy" if stormy?
    raise "Cannot land plane: airport full" if full?
    raise "Cannot land plane: plane already landed" if at_airport?(plane)
    @planes << plane
    plane
  end

  def take_off(plane)
    raise "Cannot take-off plane: weather is too stormy" if stormy?
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

  def stormy?
   @weather.stormy?
  end

  def landed?
  end
end