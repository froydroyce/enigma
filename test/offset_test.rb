require './test/test_helper.rb'
require './lib/key'
require './lib/offset'

class OffsetTest < MiniTest::Test
  def setup
    @offset = Offset.new("280388")
  end

  def test_it_exists

    assert_instance_of Offset, @offset
  end

  def test_it_has_attributes

    assert_equal "280388", @offset.date
  end


end