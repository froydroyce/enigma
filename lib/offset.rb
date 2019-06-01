class Offset
  attr_reader :date, :key, :offset_keyset

  def initialize(key, date = today)
    @key = key
    @date = date
    @offset_keyset = offset_keys
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

  def offset_keys
    @key.keyset.zip(convert_date).map do |key, offset_key|
      key + offset_key
    end
  end
end
