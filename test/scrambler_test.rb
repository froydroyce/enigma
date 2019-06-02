require './test/test_helper.rb'
require './lib/key'
require './lib/offset'
require './lib/scrambler'

class ScramblerTest < MiniTest::Test
  def setup
    @key = Key.new("02715")
    @offset = Offset.new(@key, "280388")
    @scrambler = Scrambler.new("hello world", @offset.offset_keyset)
  end

  def test_it_exists

    assert_instance_of Scrambler, @scrambler
  end

  def test_it_has_attributes

    assert_equal "hello world", @scrambler.msg
    assert_equal [2, 32, 75, 19], @scrambler.keys
  end

  def test_it_can_zip_keys_with_letters

    assert_equal ["h", 2], @scrambler.zip_keys_with_letters.first
    assert_equal ["d", 75], @scrambler.zip_keys_with_letters.last
  end

  def test_it_can_scramble

    assert_equal "jjfdqeqgtqy", @scrambler.scramble
  end

  def test_it_can_descramble

    assert_equal "hello world", @scrambler.descramble
  end
end
