require 'pry'
class NightWrite


  open_file = File.open(ARGV[0], "r")
  #binding.pry

  english_text = open_file.read
  character_count = english_text.strip.length
  open_file.close


  braille_text = english_text.upcase #call braille converter method on english_text
  #night_writer = NightWriter.new(english_text) #call braille converter method on english_text
  #night_writer.translate_text
  writer = File.open(ARGV[1], "w")

  writer.write(braille_text)

  writer.close
  puts "Created '#{ARGV[1]}' containing #{character_count} characters."

end
