require './lib/mod/generator_module'

class Key
  include GeneratorModule

  attr_reader :numbers

  def initialize(numbers = random_numbers)
    @numbers = numbers
  end

  def generate_keyset
    @numbers.chars.each_cons(2).map do |number|
      number.join.to_i
    end.map { |joined_num| joined_num.to_i }
  end
end
