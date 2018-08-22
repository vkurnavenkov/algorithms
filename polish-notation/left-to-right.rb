require 'set'

def process(expr)
  operators = Set['+', '-', '*', '/']
  operand_stack = []
  expr.each do |v|
    if operators.include?(v)
      operand2 = operand_stack.pop
      operand1 = operand_stack.pop
      result =
        case v
        when '+'
          operand1 + operand2
        when '-'
          operand1 - operand2
        when '*'
          operand1 * operand2
        when '/'
          (operand1.to_f / operand2.to_f).to_i
        end
      operand_stack.push(result)
    else
      operand_stack.push(v.to_i)
    end
    # puts operand_stack.to_s
  end
  operand_stack.empty? ? nil : operand_stack.pop
end

# ((15 ÷ (7 − (1 + 1))) × 3) − (2 + (1 + 1))
puts process([15, 7, 1, 1, '+', '-', '/', 3, '*', 2, 1, 1, '+', '+', '-']) # 5

# ((10 * (6 / ((9 + 3) * -11) )) + 17) + 5
puts process(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]) # 22
