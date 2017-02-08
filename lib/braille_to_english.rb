require './lib/alphabet'

class BrailleToEnglish
  attr_reader :braille

  def initialize(braille)
    @braille = braille
  end

  def split
    braille.map do |line|
    line.scan(/../)
    end
  end

end
