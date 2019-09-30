class BeerSong
  def verse(verse_num)
    BeerSongVerse.new(verse_num).text
  end

  def verses(starting, ending)
    (ending..starting).to_a.reverse.map { |num| verse(num) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

class BeerSongVerse
  attr_reader :text

  def initialize(num)
    @verse_num = num
    @verse_lookup = [LastVerse, SecondToLastVerse, ThirdToLastVerse] +
                    [NormalVerse] * 97
  end

  def text
    @verse_lookup[@verse_num].new(@verse_num).text
  end

end

class NormalVerse < BeerSongVerse
  def text
    "#{@verse_num} bottles of beer on the wall, #{@verse_num} bottles of beer.\n" \
      "Take one down and pass it around, #{@verse_num - 1} bottles of beer on the wall.\n"
  end
end

class LastVerse < BeerSongVerse
  def text
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class SecondToLastVerse < BeerSongVerse
  def text
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class ThirdToLastVerse < BeerSongVerse
  def text
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end
