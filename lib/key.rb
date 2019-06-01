class Key
  attr_reader :numbers, :keyset

  def initialize(numbers = random_numbers)
    @numbers = numbers
    @keyset = generate_keys
  end

  def random_numbers
    rand(0..99999).to_s.rjust(5, "0")
  end

  def generate_keys
    numbers.chars.each_cons(2).map do |number|
      number.join.to_i
    end.map { |joined_num| joined_num.to_i }
  end
end
