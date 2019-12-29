class Weather

  # call methods directly on Kernel to stub out random numbers in tests
  def stormy?
    Kernel.rand(1..6) > 4
  end
end