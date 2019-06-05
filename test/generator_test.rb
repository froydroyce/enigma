require './test/test_helper.rb'
require './lib/key'
require './lib/offset'
require './lib/scrambler'
require './lib/mod/generator_module'

class GeneratorModuleTest < Minitest::Test
  def setup
    @key = Key.new
    @offset = Offset.new
  end

  def test_it_can_make_random_numbers

    Key.stub_any_instance(:random_numbers, "98765") do
      assert_equal "98765", @key.random_numbers
    end
  end

  def test_it_can_show_todays_date_in_ddmmyy

    Offset.stub_any_instance(:date_ddmmyy, "010619") do
      assert_equal "010619", @offset.date_ddmmyy
    end
  end
end
