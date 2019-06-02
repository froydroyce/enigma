require './test/test_helper.rb'
require './lib/key'

class KeyTest < MiniTest::Test
  def setup
    @key = Key.new("02715")
    @key_2 = Key.new
  end

  def test_it_exists

    assert_instance_of Key, @key
  end

  def test_it_has_attributes

    assert_equal "02715", @key.numbers
  end

  def test_it_has_default_of_random_numbers

    Key.stub_any_instance(:numbers,"98765") do
      assert_equal "98765", @key_2.numbers
    end
  end

  def test_it_can_generate_keys

    assert_equal [02, 27, 71, 15], @key.generate_keyset
  end
end
