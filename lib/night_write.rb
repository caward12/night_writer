require 'pry'
require './lib/english_to_braille'

class NightWrite

    attr_reader :file1, :new_file, :braille

    def initialize
      @file1 = ARGV[0]
      @new_file = ARGV[1]
    end

    def open_english_file
      File.open(file1, "r")
    end

    def read_file
      open_english_file.read.gsub("\n", " ")
    end

    def gets_character_count
      read_file.strip.length
    end

    def translate_english_to_braille
      english_text = EnglishToBraille.new(read_file)
      english_text.output_lines
      braille = english_text.print_lines
    end

    def save_braille_to_file
      writer = File.open(new_file, "w")
      writer.write(translate_english_to_braille)
      writer.close
    end

    def print_message
     puts "Created '#{ARGV[1]}' containing #{gets_character_count} characters."
    end

end

test1 =  NightWrite.new

test1.translate_english_to_braille
test1.save_braille_to_file
test1.print_message
