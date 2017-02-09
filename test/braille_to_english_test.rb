
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_to_english'

class BrailleToEnglishTest < Minitest::Test
  def test_it_can_split_up_string_into_two_character_strings
    bte1 = BrailleToEnglish.new(["0.0.00", "..0...", "......"])
    expected1 = [["0.", "0.", "00"], ["..", "0.", ".."], ["..", "..", ".."]]

    bte2 = BrailleToEnglish.new ([".00.0...000..0", "0000.0......00", "0...........0."])
    expected2 = [[".0", "0.", "0.", "..", "00", "0.", ".0"], ["00", "00", ".0", "..", "..", "..", "00"], ["0.", "..", "..", "..", "..", "..", "0."]]
    assert_equal expected1, bte1.split
    assert_equal expected2, bte2.split
  end

  def test_it_can_put_braille_letters_back_together

    bte1 = BrailleToEnglish.new(["0.0.00", "..0...", "......"])
    expected1 = [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]]

    bte2 = BrailleToEnglish.new([".00.0...000..0", "0000.0......00", "0...........0."])
    expected2 = [[".0", "00", "0."], ["0.", "00", ".."], ["0.", ".0", ".."], ["..", "..", ".."], ["00", "..", ".."], ["0.", "..", ".."], [".0", "00", "0."]]

    assert_equal expected1, bte1.match
    assert_equal expected2, bte2.match
  end

  def test_it_can_match_english_letter_to_braille_letter
    bte1 = BrailleToEnglish.new(["0.0.00", "..0...", "......"])

    bte2 = BrailleToEnglish.new([".00.0...000..0", "0000.0......00", "0...........0."])

    assert_equal ["a", "b", "c"], bte1.english_match
    assert_equal ["t", "h", "e", " ", "c", "a", "t"], bte2.english_match
  end

  def test_it_can_ID_capital_letters
    bte1 = BrailleToEnglish.new(["..00", "...0", ".00."])
    bte2 = BrailleToEnglish.new(["0...000.", ".0...0.0", "0..00.0."])
    bte3 = BrailleToEnglish.new(["..000.", "...0.0", ".00.0."])

    assert_equal [["..00", "...0", ".00."]], bte1.find_capitals
    assert_equal [["0.", ".0", "0."],["..00", "...0", ".00."],["0.", ".0", "0."]], bte2.find_capitals
    assert_equal [["..00", "...0", ".00."], ["0.", ".0", "0."]], bte3.find_capitals
  end

  def test_it_can_make_english_words
    bte1 = BrailleToEnglish.new(["0.0.00", "..0...", "......"])
    bte2 = BrailleToEnglish.new([".00.0...000..0", "0000.0......00", "0...........0."])
    bte3 = BrailleToEnglish.new(["..000.", "...0.0", ".00.0."])

    assert_equal "abc", bte1.sentence
    assert_equal "the cat", bte2.sentence
    assert_equal "No", bte3.sentence
  end



end
