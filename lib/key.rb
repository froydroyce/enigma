class Key
  attr_reader :numbers

  def initialize(numbers = random_numbers)
    @numbers = numbers
  end

  def random_numbers
    rand(0..99999).to_s.rjust(5, "0")
  end

  def generate_key

  end
end
