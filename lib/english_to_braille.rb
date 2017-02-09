require './lib/alphabet'
require 'pry'

class EnglishToBraille
  attr_reader :text, :ALPHABET, :first, :second, :third, :lines

  def initialize(text)
    @text = text
    @first = []
    @second = []
    @third = []
    @lines = []
  end

  def separate_letters
    text.split("")
  end

  def swap_letters
    separate_letters.map do |letter|
       ALPHABET.fetch_values(letter)
    end
  end

  def output_lines
    swap_letters.map do |character|
      character.map do |braille|
        first << braille[0]
        second << braille[1]
        third << braille[2]
      end
    end
  end

  def print_lines

    n = first.join.length
    final_string = ""
      final_string << first.join + "\n"
      final_string << second.join + "\n"
      final_string << third.join + "\n"
    final_string

  end
#inding.pry
end
