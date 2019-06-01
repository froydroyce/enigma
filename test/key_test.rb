require './test/test_helper.rb'
require './lib/key'

class KeyTest < MiniTest::Test
  def setup
    @key = Key.new("02716")
  end

  def test_it_exists

    assert_instance_of Key, @key
  end

  def test_it_has_attributes

    assert_equal "02715", @key.numbers
  end

end
