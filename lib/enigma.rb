class Enigma

  def offset(key, date)
    keyset = Key.new(key).generate_keyset
    Offset.new(date).offset_keys(keyset)
  end

  def encrypt(message, key = Key.new.numbers, date = Offset.new.date)
    enc = Hash.new
    enc[:encryption] = Scrambler.new(message).scramble(offset(key, date))
    enc[:key] = key
    enc[:date] = date
    enc
  end

  def decrypt(message, key = Key.new.numbers, date = Offset.new.date)
    enc = Hash.new
    enc[:decryption] = Scrambler.new(message).descramble(offset(key, date))
    enc[:key] = key
    enc[:date] = date
    enc
  end
end
