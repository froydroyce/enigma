class Scrambler
  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def zip_keys_with_letters(offset, msg)
    msg.chars.each_slice(4).map do |slice|
      slice.to_a
    end.flat_map do |letter_group|
      letter_group.zip(offset)
    end
  end

  def scramble(offset, msg, process)
    zip_keys_with_letters(offset, msg).map do |letter, key|
      next letter if !@char_set.include? letter
      if process == "encrypt"
        @char_set.rotate(@char_set.index(letter) + key).first
      elsif process == "decrypt"
        @char_set.rotate(@char_set.index(letter) + (key * -1)).first
      end
    end.join
  end
end
