require './test/test_helper.rb'
require './lib/key'

class KeyTest < MiniTest::Test
  def setup
    @key = Key.new
  end

  def test_it_exists
    @key = Key.new

    assert_instance_of Key, key
  end


end