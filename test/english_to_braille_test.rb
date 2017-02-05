require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/english_to_braille_converter'

class EnglishToBrailleTest < Minitest::Test
  def test_it_can_split_letters
  test = EnglishToBraille.new("the")

  assert_equal ["t", "h", "e"], test.separate_letters
  end

  def test_it_can_swap_braille_for_english_letter
    test = EnglishToBraille.new("cat")
    test.separate_letters

    assert_equal [[["00", "..", ".."]], [["0.", "..", ".."]], [[".0", "00", "0."]]], test.swap_letters
  end

  def test_it_can_swap_braille_for_english_capital_letter
    test = EnglishToBraille.new("CAT")
    test.separate_letters

    assert_equal [[["..00", "....", ".0.."]], [["..0.", "....", ".0.."]], [["...0", "..00", ".00."]]], test.swap_letters
  end

  def test_it_can_swap_numbers
  test = EnglishToBraille.new("123")
  test.separate_letters

  assert_equal [[[".00.", ".0..", "00.."]], [[".00.", ".00.", "00.."]], [[".000", ".0..", "00.."]]], test.swap_letters
  end

  def test_it_can_swap_multiple_words
    test = EnglishToBraille.new("the cat")
    test.separate_letters

    assert_equal [[[".0", "00", "0."]], [["0.", "00", ".."]], [["0.", ".0", ".."]], [["..", "..", ".."]], [["00", "..", ".."]], [["0.", "..", ".."]], [[".0", "00", "0."]]], test.swap_letters
  end

  def test_it_can_split_braille_into_three_lines
    test = EnglishToBraille.new("cat")
    test.separate_letters
    test.swap_letters
    test.output_lines

    assert_equal ["00", "0.",".0"], test.first
    assert_equal ["..", "..", "00"], test.second
    assert_equal ["..", "..", "0."], test.third
  end

  def test_it_can_print_braille
    test = EnglishToBraille.new("cat")
    test.separate_letters
    test.swap_letters
    test.output_lines

    assert_equal [["00", "0.", ".0"], ["..", "..", "00"], ["..", "..", "0."]], test.print_lines
  end


end
