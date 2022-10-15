module ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.value(colors)
    first, second, _ = colors
    (COLORS.index(first).to_s + COLORS.index(second).to_s).to_i
  end
end