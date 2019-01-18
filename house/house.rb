class House
  def initialize
    @song = ""
  end

  def self.recite
    new.recite
  end

  def recite
    counter = 0
    while counter < pieces.size
      @song << "This is"
      pieces[counter..-1].each do |sentence|
        if sentence[0].match?(/built$/)
          @song << " #{sentence[0]}.\n#{sentence[1]}"
        else
          @song << " #{sentence[0]}\n#{sentence[1]}"
        end
      end
      @song << "\n"
      counter += 1
    end
    @song.split("\n\n").reverse.join("\n\n") << "\n"
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end