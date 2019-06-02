class Enigma

  def offset(key, date)
    keyset = Key.new(key).generate_keyset
    Offset.new(date).offset_keys(keyset)
  end

  def encrypt(msg, key = Key.new.numbers, date = Offset.new.date)
    enc = Hash.new
    enc[:encryption] = Scrambler.new.scramble(offset(key, date), msg.downcase)
    enc[:key] = key
    enc[:date] = date
    enc
  end

  def decrypt(msg, key = Key.new.numbers, date = Offset.new.date)
    dec = Hash.new
    dec[:decryption] = Scrambler.new.descramble(offset(key, date), msg.downcase)
    dec[:key] = key
    dec[:date] = date
    dec
  end
end
