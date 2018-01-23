class BeerSong
  def verse(left)
    if left > 2
      "#{left} bottles of beer on the wall, #{left} bottles of beer.\n" \
      "Take one down and pass it around, #{left - 1} bottles of beer on the wall.\n"
    elsif left == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    elsif left == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def verses(first, last)
    (first.downto(last)).to_a.each_with_object('') do |num, partial_song| 
      partial_song << verse(num) + "\n"
    end
    .chomp
  end

  def lyrics
    verses(99, 0)
  end
end

module BookKeeping
  VERSION = 3
end
