require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus_stop')
require_relative('../person')

class BusStopTest < MiniTest::Test

  def setup()
    @bus_stop = BusStop.new("Portobello")

    @person = Person.new("Bob", 3)
  end

  def test_bus_stop_has_name()
    assert_equal("Portobello", @bus_stop.name)
  end

  def test_can_add_person_to_queue()
    @bus_stop.add_to_queue(@person)
    assert_equal(1, @bus_stop.queue_length)
  end

end
