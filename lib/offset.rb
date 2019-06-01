class Offset
  attr_reader :date, :key

  def initialize(key, date = today)
    @key = key
    @date = date
  end

  def today
    Date.today.strftime("%d%m%y")
  end
end
