require './test/test_helper.rb'
require './lib/key'
require './lib/offset'
require './lib/scrambler'

class ScramblerTest < MiniTest::Test
  def setup
    @key = Key.new("02715").generate_keyset
    @offset = Offset.new("280388").offset_keys(@key)
    @scrambler = Scrambler.new
    @msg = "hello world"
  end

  def test_it_exists

    assert_instance_of Scrambler, @scrambler
  end

  def test_it_has_attributes

    assert_equal "a", @scrambler.char_set.first
    assert_equal " ", @scrambler.char_set.last
  end

  def test_it_can_zip_keys_with_letters

    assert_equal ["h", 2], @scrambler.zip_keys_with_letters(@offset, @msg).first
    assert_equal ["d", 75], @scrambler.zip_keys_with_letters(@offset, @msg).last
  end

  def test_it_can_scramble

    assert_equal "jjfdqeqgtqy", @scrambler.scramble(@offset, @msg)
  end

  def test_it_can_descramble


    assert_equal "hello world", @scrambler.descramble(@offset, "jjfdqeqgtqy")
  end
end
