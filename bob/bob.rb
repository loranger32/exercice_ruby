class Bob
  BOB_ANSWERS = { question: "Sure.", yelling: "Whoa, chill out!", 
                  nothing: "Fine. Be that way!", whatever: "Whatever."}.freeze

  def self.hey(remark)
    if is_yelling?(remark)
      BOB_ANSWERS[:yelling]
    elsif is_a_question?(remark)
      BOB_ANSWERS[:question]
    elsif is_an_empty?(remark)
      BOB_ANSWERS[:nothing]
    else
      BOB_ANSWERS[:whatever]
    end
  end

  def self.is_yelling?(remark)
    remark.each_char.none? { |char| char.match(/[a-z]/) } &&
      not_an_empty?(remark) && not_only_numbers_in?(remark)
  end

  def self.is_a_question?(remark)
    remark.rstrip[-1] == '?' 
  end

  def self.not_an_empty?(remark)
    !remark.each_char.none? { |char| char.match(/[a-zA-Z0-9]/) }
  end

  def self.is_an_empty?(remark)
    remark.each_char.none? { |char| char.match(/[a-zA-Z0-9]/) }
  end

  def self.not_only_numbers_in?(remark)
    !remark.each_char.all? { |char| char.match(/\d|\W/) }
  end
end

class BookKeeping
  VERSION = 1
end
