class Bus

  attr_reader :route_number, :destination

  def initialize(route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive()
    return "Brum brum"
  end

  def passenger_count()
    return @passengers.length
  end

  def pick_up(passenger)
    @passengers.push(passenger)
  end

  def drop_off(passenger)
    @passengers.delete(passenger)
  end

  def empty()
    for passenger in @passengers
      @passengers.delete(passenger)
    end
  end

  def pick_up_from_stop(bus_stop)
    for person in bus_stop.queue
      bus_stop.remove_from_queue(person)
      pick_up(person)
    end
    for person in @passengers
      pick_up(person)
    end
  end

end
