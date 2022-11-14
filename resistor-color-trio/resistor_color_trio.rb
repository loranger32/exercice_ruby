class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
  PREFIX_STR = "Resistor value: ".freeze
  OHMS = "ohms".freeze
  KILOOMHS = "kiloohms".freeze

  def initialize(colors)
    validate_args(colors)
    @color_1, @color_2, @power = *colors
  end

  def label
    PREFIX_STR + digits + " " + unit
  end

  private

  def base_digits
    [@color_1, @color_2].map { COLORS.index(_1).to_s }.join
  end

  def digits
    raw_digits = base_digits + zeros
    raw_digits.size >= 4 ? raw_digits[0..-4] : raw_digits 
  end

  def zeros
    "0" * COLORS.index(@power)
  end

  def unit
    COLORS[0..1].include?(@power) ? OHMS : KILOOMHS
  end

  def validate_args(values)
    raise ArgumentError unless values.all? {COLORS.include? _1 }
  end
end
