require './test/test_helper.rb'
require './lib/key'

class KeyTest < MiniTest::Test
  def setup
    @key = Key.new("02715")
  end

  def test_it_exists

    assert_instance_of Key, @key
  end

  def test_it_has_attributes

    assert_equal "02715", @key.numbers
  end

  def test_it_can_make_random_numbers

    refute_equal @key.numbers, @key.random_numbers
    assert_equal 5, @key.random_numbers.length
    assert_equal 5, @key.random_numbers.length
    assert_equal 5, @key.random_numbers.length
    assert_equal 5, @key.random_numbers.length
    assert_equal 5, @key.random_numbers.length
  end

  def test_it_has_default_of_random_numbers
    key_2 = Key.new

    refute_equal "02175", key_2.numbers
  end

  # def test_it_can_generate_key
  #
  #   assert_equal
  # end

end
