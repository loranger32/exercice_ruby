class Nucleotide
  HISTOGRAM = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }

  def self.from_dna(strand)
    new(strand)
  end

  def initialize(strand)
    raise ArgumentError unless is_valid?(strand)
    @strand = strand
  end

  def count(nucleotide)
    @strand.count(nucleotide)
  end

  def histogram
    @strand.each_char.with_object(HISTOGRAM.dup) do |nucleotide, histogram| 
      histogram[nucleotide] += 1
    end
  end

  def is_valid?(strand)
    strand.match?(/\A[ACGT]*\z/)
  end
end
