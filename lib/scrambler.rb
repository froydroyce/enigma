class Scrambler
  attr_reader :msg, :keys

  def initialize(msg, keys)
    @msg = msg
    @keys = keys
  end
end
