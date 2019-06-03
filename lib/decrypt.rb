require './lib/key'
require './lib/offset'
require './lib/scrambler'
require './lib/enigma'
require 'date'
require 'pry'

encrypted = File.open(ARGV[0], "r")
message = encrypted.read

enigma = Enigma.new
dec_msg = enigma.decrypt(message, ARGV[2], ARGV[3])

decrypted = File.open(ARGV[1], "w")
decrypted.write(dec_msg[:decryption])

puts "Created 'decrypted.txt' with the key #{dec_msg[:key]} and date #{dec_msg[:date]}"
