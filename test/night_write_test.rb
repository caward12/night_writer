gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'

class NightWriteTest < Minitest::Test

  def test_it_has_a_file_to_read
    test_file = NightWrite.new("message.txt", "braille.txt")

    assert_equal "message.txt", test_file.file1
  end

  def test_it_gets_accurate_character_count
    test_file = NightWrite.new("small_test.txt", "braille.txt")
    result = test_file.gets_character_count
    assert_equal 1, result
  end

  def test_it_gets_braille_message_to_save
    # test the desired translate_english_to_braille method
    # make sure that it's returning the braille we want back
    # in order to write to a new file
  end

end
