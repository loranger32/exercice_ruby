class SecretHandshake
  CODE_TABLE = { 8 => 'jump', 4 => 'close your eyes', 2 => 'double blink',
                 1 => 'wink' }
  REVERSE_CODE = 16

  def initialize(input)
    @code_in_number = input.to_i
    @code_in_signs  = []
    @reverse_code = need_to_reverse?
  end

  def commands
    translate_input_in_signs
    @reverse_code ? @code_in_signs : @code_in_signs.reverse
  end

  private

  def translate_input_in_signs
    CODE_TABLE.each do |code, value|
      if @code_in_number - code >= 0
        @code_in_signs << value
        @code_in_number -= code
      end
    end
  end

  def need_to_reverse?
    if @code_in_number - REVERSE_CODE >= 0
      @code_in_number -= REVERSE_CODE
      true
    end
  end
end