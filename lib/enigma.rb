class Enigma
  def instantiate(msg, key, date, process)
    keyset = Key.new(key).generate_keyset
    offset = Offset.new(date).offset_keys(keyset)
    { scrambler: Scrambler.new.scramble(offset, msg.downcase, process) }
  end

  def encrypt(msg, key = Key.new.numbers, date = Offset.new.date)
    encrypted = instantiate(msg, key, date, "encrypt")
    { encryption: encrypted[:scrambler], key: key, date: date }
  end

  def decrypt(msg, key = Key.new.numbers, date = Offset.new.date)
    decrypted = instantiate(msg, key, date, "decrypt")
    { decryption: decrypted[:scrambler], key: key, date: date }
  end

  def crack(msg, date = Offset.new.date)
    until msg[-4..-1] == " end"
      cracked = decrypt(msg, Key.new.numbers, date)
      msg = cracked[:decryption]
    end
    cracked
  end
end
