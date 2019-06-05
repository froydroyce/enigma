require './test/test_helper.rb'
require './lib/key'
require './lib/offset'

class OffsetTest < MiniTest::Test
  def setup
    @key = Key.new("02715")
    @offset = Offset.new("280388")
    @offset_2 = Offset.new
  end

  def test_it_exists

    assert_instance_of Offset, @offset
  end

  def test_it_has_attributes

    assert_equal "280388", @offset.date
  end

  def test_todays_date_is_default

    Offset.stub_any_instance(:date, "010619") do
      assert_equal "010619", @offset_2.date
    end
  end

  def test_it_can_convert_date

    assert_equal [0, 5, 4, 4], @offset.convert_date
  end

  def test_it_can_offset_keys

    assert_equal [2, 32, 75, 19], @offset.offset_keys(@key.generate_keyset)
  end

end
