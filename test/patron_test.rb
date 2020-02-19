require_relative 'test_helper'
require './lib/exhibit'
require './lib/patron'

class PatronTest < MiniTest::Test
  def setup
    @patron_1 = Patron.new("Bob", 20)
  end

  def test_it_exists_with_attributes
    assert_instance_of Patron, @patron_1
    assert_equal "Bob", @patron_1.name
    assert_equal 20, @patron_1.spending_money
  end

  def test_it_can_add_interests
    assert_equal [], @patron_1.interests

    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")

    expected = ["Dead Sea Scrolls", "Gems and Minerals"]
    assert_equal expected, @patron_1.interests
  end
end
