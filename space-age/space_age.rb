class SpaceAge
  YEAR_IN_SECOND = 60 * 60 * 24 * 365.25
  ORBITAL_PERIODS = { earth: 1,
                      mercury: 0.2408467,
                      venus: 0.61519726,
                      mars: 1.8808158,
                      jupiter: 11.862615,
                      saturn: 29.447498,
                      uranus: 84.016846,
                      neptune: 164.79132 }

  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  ORBITAL_PERIODS.each do |planet, _| 
    define_method "on_#{planet}" do
      calculate_age_on(planet.to_sym)
    end
  end

  private

  def calculate_age_on(planet)
    (@age_in_seconds / (ORBITAL_PERIODS[planet] * YEAR_IN_SECOND)).round(2)
  end
end

module BookKeeping
  VERSION = 1
end
