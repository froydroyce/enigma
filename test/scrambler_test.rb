require './test/test_helper.rb'
require './lib/key'
require './lib/offset'
require './lib/scrambler'

class ScramblerTest < MiniTest::Test
  def setup
    @scrambler = Scrambler.new
  end

  def test_it_exists

    assert_instance_of Scrambler, @scrambler
  end
end
