require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_to_braille'

class EnglishToBrailleTest < Minitest::Test
  def test_it_can_split_letters
  etb= EnglishToBraille.new("the")

  assert_equal ["t", "h", "e"], etb.separate_letters
  end

  def test_it_can_swap_braille_for_english_letter

    etb = EnglishToBraille.new("cat")
    etb.separate_letters

    assert_equal [[["00", "..", ".."]], [["0.", "..", ".."]], [[".0", "00", "0."]]], etb.swap_letters
  end

  def test_it_can_swap_braille_for_english_capital_letter

    etb = EnglishToBraille.new("CAT")
    etb.separate_letters

    assert_equal [[["..00", "....", ".0.."]], [["..0.", "....", ".0.."]], [["...0", "..00", ".00."]]], etb.swap_letters
  end

  def test_it_can_swap_numbers

  etb = EnglishToBraille.new("123")
  etb.separate_letters

  assert_equal [[[".00.", ".0..", "00.."]], [[".00.", ".00.", "00.."]], [[".000", ".0..", "00.."]]], etb.swap_letters
  end

  def test_it_can_swap_multiple_words

    etb = EnglishToBraille.new("the cat")
    etb.separate_letters

    assert_equal [[[".0", "00", "0."]], [["0.", "00", ".."]], [["0.", ".0", ".."]], [["..", "..", ".."]], [["00", "..", ".."]], [["0.", "..", ".."]], [[".0", "00", "0."]]], etb.swap_letters
  end

  def test_it_can_split_braille_into_three_lines
    etb = EnglishToBraille.new("cat")
    etb.output_lines

    assert_equal ["00", "0.",".0"], etb.first
    assert_equal ["..", "..", "00"], etb.second
    assert_equal ["..", "..", "0."], etb.third
  end


  def test_it_can_print_braille

    etb = EnglishToBraille.new("cat")
    # test.separate_letters
    # test.swap_letters
    etb.output_lines

    assert_equal +"000..0
....00
....0.
", etb.print_lines
  end



end
