require './test/test_helper.rb'
require './lib/key'
require './lib/offset'

class OffsetTest < MiniTest::Test
  def setup
    @offset = Offset.new
  end

  def test_it_exists

    assert_instance_of Offset, @offset
  end
end
