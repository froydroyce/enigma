require './lib/key'
require './lib/offset'
require './lib/scrambler'
require './lib/enigma'
require 'date'
require 'pry'

unencrypted = File.open(ARGV[0], "r")
message = unencrypted.read

enigma = Enigma.new
enc_msg = enigma.encrypt(message, ARGV[2], ARGV[3])

encrypted = File.open(ARGV[1], "w")
encrypted.write(enc_msg[:encryption])

puts "Created 'encrypted.txt' with the key #{enc_msg[:key]} and date #{enc_msg[:date]}"
