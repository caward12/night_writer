require 'pry'
require './lib/english_to_braille_converter'

class NightWrite

    attr_reader :file1, :new_file, :braille

    def initialize#(file1, new_file)
      @file1 = ARGV[0]
      @new_file = ARGV[1]
    end

    def open_english_file
      #opened_file =
      File.open(file1, "r")
    end

    def read_file
      open_english_file.read.gsub("\n", " ")
    end

    def gets_character_count
      read_file.strip.length?
    end

    def translate_english_to_braille
      english_text = EnglishToBraille.new(read_file)
      # english_text.separate_letters
      # english_text.swap_letters
      english_text.output_lines
      braille = english_text.print_lines
      #ead_file.capitalize
    end

    def save_braille_to_file
      writer = File.open(new_file, "w")
      writer.write(translate_english_to_braille)
      writer.close
    end

    # def print_message
     #puts "Created '#{ARGV[1]}' containing #{gets_character_count} characters."
    # end


  # open_file = File.open(ARGV[0], "r")
  # #binding.pry
  #
  # english_text = open_file.read
  # character_count = english_text.strip.length
  # open_file.close
  #
  #
  # braille_text = english_text.upcase #call braille converter method on english_text
  # #night_writer = NightWriter.new(english_text) #call braille converter method on english_text
  # #night_writer.translate_text
  # writer = File.open(ARGV[1], "w")
  #
  # writer.write(braille_text)
  #
  # writer.close
  # puts "Created '#{ARGV[1]}' containing #{gets_character_count} characters."

end

test1 =  NightWrite.new
# test1.open_english_file
# test1.read_file
# test1.gets_character_count
test1.translate_english_to_braille
test1.save_braille_to_file
