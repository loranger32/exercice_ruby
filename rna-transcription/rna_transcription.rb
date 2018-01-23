class Complement
  
  DNA_TO_RNA = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }
  DNA_NUCLEIDES = DNA_TO_RNA.keys.join

  def self.of_dna(dna_string)
    return '' unless dna_string.count(DNA_NUCLEIDES) == dna_string.size
    dna_string.each_char.map { |char| DNA_TO_RNA[char] }.join
  end
end

module BookKeeping
  VERSION = 4
end
