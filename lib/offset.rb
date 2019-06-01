class Offset
  attr_reader :date, :key

  def initialize(key, date = today)
    @key = key
    @date = date
  end

  def today
    Date.today.strftime("%d%m%y")
  end

  def convert_date
    date_i = @date.to_i
    (date_i * date_i).to_s.split(//).last(4).map do |number|
      number.to_i
    end
  end
end
