require './test/test_helper.rb'
require './lib/key'
require './lib/offset'
require './lib/scrambler'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists

    assert_instance_of Enigma, @enigma
  end

  def test_it_can_make_offset

    assert_equal [3, 27, 73, 20], @enigma.offset("02715", "040895")
  end

  def test_it_can_encrypt
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
end
