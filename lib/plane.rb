class Plane

  def take_off
    raise "Plane cannot take-off: already flying"
  end

  def airport
    raise "Plane not in airport: already flying"
  end
end