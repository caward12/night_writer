gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '..lib/night_write'

class NightWriteTest < Minitest::Test

  def test_it_has_a_file_to_read
    new_file = NightWrite.new("message.txt", "braille.txt")

    assert_equal 'message.txt', new_file
  end

  # def test_it_has_a_file_to_write
  #
  # end

end
