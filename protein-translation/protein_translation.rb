class InvalidCodonError < StandardError; end
module Translation
 CODONS =  {"AUG" => "Methionine",
  "UUU" => "Phenylalanine",
  "UUC" => "Phenylalanine",
  "UUA" => "Leucine",
  "UUG" => "Leucine", 
  "UCU" => "Serine",
  "UCC" => "Serine",
  "UCA" => "Serine",
  "UCG" => "Serine", 
  "UAU" => "Tyrosine",
  "UAC" => "Tyrosine", 
  "UGU" => "Cysteine",
  "UGC" => "Cysteine",
  "UGG" => "Tryptophan",
  "UAA" => "STOP",
  "UAG" => "STOP",
  "UGA" => "STOP"}.freeze

  def self.of_codon(codon)
    protein = CODONS[codon]
    raise InvalidCodonError if protein.nil?
    protein
  end

  def self.of_rna(strand)
    strand.chars.each_slice(3).with_object([]) do |codon, result|
      protein = of_codon(codon.join)
      return result if protein == "STOP"
      result << protein
    end
  end
end