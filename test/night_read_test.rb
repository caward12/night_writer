gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_read'

class NightReadTest < Minitest::Test
  def test_it_has_a_file_to_read
    new_file = NightRead.new("braille.txt", "english.txt")

    assert_equal "braille.txt", new_file.ARGV[0]
  end

end
