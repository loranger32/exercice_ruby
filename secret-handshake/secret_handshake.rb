# Input:
# - an integer of base 10

# Output:
# - An array of strings

# Processing:
# - Convert secret code table into decimal system
# - substract recursively the values of the code table from the input value,
#   starting with the biggest :
#     - If result is positive, add code
#     - else skip to next (smaller) code table value

# If the biggest value can be susbtracted, add a flag to reverse the code at the end.

class SecretHandshake
  CODE_TABLE = { 1 => 'wink', 2 => 'double blink', 4 => 'close your eyes',
                  8 => 'jump' }
  REVERSE_CODE = 16

  def initialize(code)
    @code    = code.to_i
    @result  = []
    @reverse = need_to_reverse?
  end

  def commands
    return @result if @code == 0

    CODE_TABLE.each do |code, value|
      if @code - code
  end

  private

  def need_to_reverse?
    if @code - REVERSE_CODE >= 0
      @code -= REVERSE_CODE
      true
    end
  end
end