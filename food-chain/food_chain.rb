module BookKeeping
  VERSION = 2
end

class FoodChain
  FIRST_SENTENCE = "I know an old lady who swallowed a ".freeze
  FORE_LAST_SENTENCE = "\nI don't know why she swallowed the fly. Perhaps she'll die.\n\n".freeze
  LAST_SENTENCE = "I know an old lady who swallowed a horse.\nShe's dead, of course!\n"

  COMMENTS = [
    "\nI don't know how she swallowed a cow!",
    "\nJust opened her throat and swallowed a goat!",
    "\nWhat a hog, to swallow a dog!",
    "\nImagine that, to swallow a cat!",
    "\nHow absurd to swallow a bird!",
    "\nIt wriggled and jiggled and tickled inside her.",
    ""
  ]

  REFRAINS = [
    "\nI don't know how she swallowed a cow.",
    "\nShe swallowed the cow to catch the goat.",
    "\nShe swallowed the goat to catch the dog.",
    "\nShe swallowed the dog to catch the cat.",
    "\nShe swallowed the cat to catch the bird.",
    "\nShe swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
    "\nShe swallowed the spider to catch the fly.",
    ]

  def self.song
    song = ""
    6.downto(0) do |index|
      song << FIRST_SENTENCE + REFRAINS[index].split.last.sub('her', 'spider')
      song << COMMENTS[index]
      index.upto(6) do |counter_index|
        song << REFRAINS[counter_index+1].to_s
      end
      song << FORE_LAST_SENTENCE
    end
    song << LAST_SENTENCE
  end
end
