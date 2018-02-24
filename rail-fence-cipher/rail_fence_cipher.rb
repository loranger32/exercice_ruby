class RailFenceCipher
  def self.encode(str, rails)
    return '' if str.empty?
    return str if rails == 1
    container = Array.new(rails) { Array.new }
    flag = :down
    counter = 1
    str.chars.each_with_index do |char, index|
      container[0].insert(index, char)
      rotate_container(container, flag)
      flag = switch_flag(flag) if counter % (rails - 1) == 0
      counter += 1
    end
    while container[0][0] != str[0]
      container.rotate!
    end
    container.flatten.join
  end

  def self.switch_flag(flag)
    case flag
    when :down then :up
    when :up then :down
    end
  end

  def self.rotate_container(container, flag)
    case flag
    when :down then container.rotate!
    when :up then container.rotate!(-1)
    end
  end

  def self.decode(str, rails)
    return '' if str.empty?
    return str if rails == 1
    # To be implemented
  end
end

module BookKeeping
  VERSION = 1
end
