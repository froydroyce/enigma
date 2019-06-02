require './test/test_helper.rb'
require './lib/key'
require './lib/offset'
require './lib/scrambler'

class ScramblerTest < MiniTest::Test
  def setup
    @key = Key.new("02715").generate_keyset
    @offset = Offset.new("280388").offset_keys(@key)
    @scrambler = Scrambler.new("hello world")
  end

  def test_it_exists

    assert_instance_of Scrambler, @scrambler
  end

  def test_it_has_attributes

    assert_equal "hello world", @scrambler.msg
  end

  def test_it_can_zip_keys_with_letters

    assert_equal ["h", 2], @scrambler.zip_keys_with_letters(@offset).first
    assert_equal ["d", 75], @scrambler.zip_keys_with_letters(@offset).last
  end

  def test_it_can_scramble

    assert_equal "jjfdqeqgtqy", @scrambler.scramble(@offset)
  end

  def test_it_can_descramble
    scrambler_1 = Scrambler.new("jjfdqeqgtqy")

    assert_equal "hello world", scrambler_1.descramble(@offset)
  end
end
