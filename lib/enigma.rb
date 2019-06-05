class Enigma
  def instantiate(msg, key, date, process)
    keyset = Key.new(key).generate_keyset
    offset = Offset.new(date).offset_keys(keyset)
    Scrambler.new.scramble(offset, msg.downcase, process)
  end

  def encrypt(msg, key = Key.new.numbers, date = Offset.new.date)
    encrypted = instantiate(msg, key, date, "encrypt")
    { encryption: encrypted, key: key, date: date }
  end

  def decrypt(msg, key = Key.new.numbers, date = Offset.new.date)
    decrypted = instantiate(msg, key, date, "decrypt")
    { decryption: decrypted, key: key, date: date }
  end

  def crack(msg, date = Offset.new.date)
    until msg[-4..-1] == " end" || msg[-5..-1] == " end\n"
      key = Key.new.numbers
      cracked = instantiate(msg, key, date, "decrypt")
      msg = cracked
    end
    { decryption: cracked, key: key, date: date }
  end
end
