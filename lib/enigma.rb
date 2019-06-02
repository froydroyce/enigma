class Enigma

  def offset(key, date)
    keyset = Key.new(key).generate_keyset
    Offset.new(date).offset_keys(keyset)
  end

  def encrypt(message, key = Key.new.numbers, date = Offset.new.date)
    encrypted = Hash.new
    encrypted[:encryption] = Scrambler.new(message, offset(key, date)).scramble
    encrypted[:key] = key
    encrypted[:date] = date
    encrypted
  end
end
