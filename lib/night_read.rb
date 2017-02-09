require './lib/braille_to_english'

class NightRead

  attr_reader :file1, :file2, :english_text
  def initialize
    @file1 = ARGV[0]
    @file2 = ARGV[1]
  end

  def open_braille_file
    File.open(file1, "r")
  end

  def read_file
    open_braille_file.readlines.map(&:chomp)
  end

  def translate_braille_to_english
    braille = BrailleToEnglish.new(read_file)
    braille.sentence
  end

  def save_to_english_file
    writer = File.open(file2, "w+")
    writer.write(translate_braille_to_english)
    writer.close
  end

  def print_message
    puts "Created '#{ARGV[1]}' containing #{translate_braille_to_english.length} characters. "
  end
end

new_file = NightRead.new

new_file.translate_braille_to_english
new_file.save_to_english_file
new_file.print_message
