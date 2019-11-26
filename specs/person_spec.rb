require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../person')

class PersonTest < MiniTest::Test

  def setup()
    @person = Person.new("Bob", 3)
  end

  def test_person_has_name
    assert_equal("Bob", @person.name)
  end

  def test_person_has_age
    assert_equal(3, @person.age)
  end

end
