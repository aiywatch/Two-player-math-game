class Question
  attr_reader :opt, :operand_1, :operand_2, :ans
  MAX_NUMBER = 10

  def initialize(opt)
    @opt = get_operator(opt)
    @operand_1 = rand(MAX_NUMBER)
    @operand_2 = rand(MAX_NUMBER)
    @ans = answer()
  end

# return operator of this question
  def get_operator(opt)
    opt.downcase!
    unless opt == 'add' || opt == 'subtract' || opt == 'multiply'
      random_op = rand(3)

      case random_op
      when 0
        opt = 'add'
      when 1
        opt = 'subtract'
      when 2
        opt = 'multiply'
      end
    end
    
    opt
  end

# return answer of this question
  def answer
    case @opt
    when 'add'
      @operand_1 + @operand_2
    when 'subtract'
      @operand_1 - @operand_2
    when 'multiply'
      @operand_1 * @operand_2
    end
  end

end