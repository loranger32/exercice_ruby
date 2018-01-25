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

  def on_earth
    calculate_age_on(:earth)
  end

  def on_mercury
    calculate_age_on(:mercury)
  end

  def on_venus
    calculate_age_on(:venus)
  end

  def on_mars
    calculate_age_on(:mars)
  end

  def on_jupiter
    calculate_age_on(:jupiter)
  end

  def on_saturn
    calculate_age_on(:saturn)
  end

  def on_uranus
    calculate_age_on(:uranus)
  end

  def on_neptune
    calculate_age_on(:neptune)
  end

  private

  def calculate_age_on(planet)
    (@age_in_seconds / (ORBITAL_PERIODS[planet] * YEAR_IN_SECOND)).round(2)
  end
end

module BookKeeping
  VERSION = 1
end
