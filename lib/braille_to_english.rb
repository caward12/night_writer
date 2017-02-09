require './lib/alphabet'
require 'pry'
class BrailleToEnglish
  attr_reader :braille, :letter_groups

  def initialize(braille)
    @braille = braille
  end

  def split
    braille.map do |line|
    line.scan(/../)
    end
  end

  def match
    split[0].zip(split[1], split[2])
  end

  def find_capitals
    #binding.pry
    letter_groups = match
    n = 0
    while n < letter_groups.length
      if letter_groups[n] == ["..", "..", ".0"]

        letter_groups[n][0].concat(letter_groups[n+1][0])
        letter_groups[n][1].concat(letter_groups[n+1][1])
        letter_groups[n][2].concat(letter_groups[n+1][2])
        letter_groups.delete_at(n+1)
      end
      n+=1
    end

    letter_groups
  end

  def english_match
    find_capitals.map do |letter|
      ALPHABET.key(letter)
    end
  end

  def sentence
    english_match.join
  end

  def character_count
    sentence.length
  end
#binding.pry
end
