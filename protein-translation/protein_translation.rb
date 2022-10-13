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
    CODONS[codon]
  end
end