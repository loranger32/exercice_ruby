require 'set'

class Robot
  LETTERS = ('A'..'Z').to_a
  DIGITS = ('0'..'9').to_a
  NAME_PATTERN = /[A-Z]{2}\d{3}/

  @names = Set.new

  def self.names
    @names
  end

  attr_reader :name

  def self.forget
    @names = Set.new
  end

  def initialize
    name = unique_name
    validate_name(name)
    @name = name
    self.class.names << @name
  end

  def reset
    self.class.names.delete(@name)
    name = unique_name
    validate_name(name)
    @name = name
    self.class.names << @name
  end

  def instance_variable_set(name = :@name, new_name)
    validate_name(new_name)
    self.class.names.delete(@name)
    @name = new_name
    self.class.names << @name
  end

  private

  def create_random_name
    result = ""
    2.times { result << LETTERS.sample }
    3.times { result << DIGITS.sample }
    result
  end

  def unique_name
    random_name = ''
    loop do
      random_name = create_random_name
      
      break unless self.class.names.include?(random_name)
    end
    random_name
  end

  def valid_name_pattern?(name)
    raise ArgumentError, "Invalid name pattern ('AA123')" unless name.match? NAME_PATTERN
  end

  def unique_name?(name)
    raise ArgumentError, "Name already exists" if self.class.names.include?(name)
  end

  def validate_name(name)
    valid_name_pattern?(name)
    unique_name?(name)
  end
end

module BookKeeping
  VERSION = 3
end
