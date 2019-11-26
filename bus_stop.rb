class BusStop

  attr_reader :name, :queue

  def initialize(name)
    @name = name
    @queue = []
  end

  def queue_length()
    return @queue.length
  end

  def add_to_queue(passenger)
    @queue.push(passenger)
  end

  def remove_from_queue(passenger)
    @queue.delete(passenger)
  end

end
