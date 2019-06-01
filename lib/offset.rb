class Offset
  attr_reader :date

  def initialize(date = today)
    @date = date
  end

  def today
    Date.today.strftime("%d%m%y")
  end
end
