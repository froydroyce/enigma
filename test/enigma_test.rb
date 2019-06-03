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

  def test_it_can_instantiate
    msg = "Hello World"
    key = "02715"
    date = "040895"
    expected = {:scrambler=>"keder ohulw"}

    assert_equal expected, @enigma.instantiate(msg, key, date, "encrypt")
  end

  def test_it_can_encrypt
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")

    expected = {
      encryption: "mfhatasdwm ",
      key: "02715",
      date: "010619"
    }

    Offset.stub_any_instance(:date, "010619") do
      assert_equal expected, @enigma.encrypt("hello world", "02715")
    end

    expected = {
      encryption: "almxhgx kse",
      key: "98765",
      date: "010619"
    }

    Offset.stub_any_instance(:date, "010619") do
      Key.stub_any_instance(:numbers, "98765") do
        assert_equal expected, @enigma.encrypt("hello world")
      end
    end
  end

  def test_it_can_decrypt
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "010619"
    }

    Offset.stub_any_instance(:date, "010619") do
      assert_equal expected, @enigma.decrypt("mfhatasdwm ", "02715")
    end
  end
end
