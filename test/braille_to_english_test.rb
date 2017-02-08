require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_to_english'

class BrailleToEnglishTest < Minitest::Test
  def test_it_can_split_up_string_into_two_character_strings
    bte = BrailleToEnglish.new(["0.0.00", "..0...", "......"])
    expected = [["0.", "0.", "00"], ["..", "0.", ".."], ["..", "..", ".."]]

    assert_equal expected, bte.split
  end



end
