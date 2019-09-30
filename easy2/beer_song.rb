require 'pry'

class BeerSong 
  def verse(verse_num)
    return "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n" if verse_num == 0
      
    verse_bottles = verse_num != 1 ? "bottles" : "bottle"
    verse_minus_one_bottles = verse_num - 1 != 1 ? "bottles" : "bottle"
    verse_num_minus_one = verse_num - 1
    
    verse_num_minus_one = verse_num_minus_one == 0 ? "no more" : verse_num_minus_one
    it_or_one = verse_num == 1 ? "it" : "one"
    
    "#{verse_num} #{verse_bottles} of beer on the wall, #{verse_num} #{verse_bottles} of beer.\n" \
      "Take #{it_or_one} down and pass it around, #{verse_num_minus_one} #{verse_minus_one_bottles} of beer on the wall.\n"
  end
  
  def verses(starting, ending)
    result = ""
    starting.downto(ending) do |verse_num|
      result += verse(verse_num)
      result += "\n" unless verse_num == ending
    end
    result
  end
  
  def lyrics
    verses(99, 0)
  end
end
