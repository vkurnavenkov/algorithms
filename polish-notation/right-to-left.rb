require 'set'

def process(expr)
  operators = Set['+', '-', '*', '/']
  operand_stack = []
  operator_stack = []
  pending_operand = false
  expr.reverse.each do |v|
    if operators.include?(v)
      operator_stack.push(v)
      pending_operand = false
    else
      operand = v
      if pending_operand
        until operand_stack.empty?
          operand1 = operand_stack.pop
          operator = operator_stack.pop
          operand =
            case operator
            when '+'
              operand1 + operand
            when '-'
              operand1 - operand
            when '*'
              operand1 * operand
            when '/'
              operand1 / operand
            end
        end
      end
      operand_stack.push(operand)
      pending_operand = true
    end
    puts operand_stack.to_s
    puts operator_stack.to_s
  end
  operand_stack.empty? ? nil : operand_stack.pop
end

# ((15 ÷ (7 − (1 + 1))) × 3) − (2 + (1 + 1))
puts process([15, 7, 1, 1, '+', '-', '/', 3, '*', 2, 1, 1, '+', '+', '-']) # 5
