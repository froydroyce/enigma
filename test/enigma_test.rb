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

  def test_it_can_encrypt
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt
  end
end
