class Offset
  attr_reader :date

  def initialize(date = Date.today.strftime("%d%m%y"))
    @date = date
  end

  def convert_date
    (@date.to_i**2).to_s.chars.last(4).map do |number|
      number.to_i
    end
  end

  def offset_keys(keyset)
    keyset.zip(convert_date).map do |key, offset_key|
      key + offset_key
    end
  end
end
