require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus')
require_relative('../person')
require_relative('../bus_stop')

class BusTest < MiniTest::Test

  def setup()
    @bus = Bus.new(26, "Preston Pans")

    @person = Person.new("Bob", 3)

    @bus_stop = BusStop.new("Portobello")
  end

  def test_bus_has_route_number()
    assert_equal(26, @bus.route_number)
  end

  def test_bus_has_destination()
    assert_equal("Preston Pans", @bus.destination)
  end

  def test_bus_drives()
    assert_equal("Brum brum", @bus.drive)
  end

  def test_passengers_starts_as_zero()
    assert_equal(0, @bus.passenger_count)
  end

  def test_bus_can_pick_up_passengers()
    @bus.pick_up(@person)
    assert_equal(1, @bus.passenger_count)
  end

  def test_bus_can_drop_off_passengers()
    @bus.pick_up(@person)
    @bus.drop_off(@person)
    assert_equal(0, @bus.passenger_count)
  end

  def test_can_empty_bus()
    @bus.pick_up(@person)
    @bus.pick_up(@person)
    @bus.pick_up(@person)
    @bus.empty()
    assert_equal(0, @bus.passenger_count)
  end

  def test_bus_can_pick_up_all_passengers_from_a_stop()
    @bus_stop.add_to_queue(@person)
    @bus_stop.add_to_queue(@person)
    @bus_stop.add_to_queue(@person)
    @bus.pick_up_from_stop(@bus_stop)
    assert_equal(0, @bus_stop.queue_length)
    assert_equal(3, @bus.passenger_count)
  end

end
