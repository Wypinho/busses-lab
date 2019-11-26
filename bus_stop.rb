class BusStop

  attr_reader :name

  def initialize(name)
    @name = name
    @queue = []
  end

end
