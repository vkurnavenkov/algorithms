#!/usr/bin/env ruby
require 'pp'

class Integer
  N_BYTES = 0.size
  N_BITS = N_BYTES * 8
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

def evaluate(a, op, b)
  ops = {
    '+' => ->(x, y) { x + y },
    '-' => ->(x, y) { x - y },
    '*' => ->(x, y) { x * y }
  }
  ops[op].call(a, b)
end

def minmax(minimums, maximums, ops, i, j)
  min_value = Integer::MAX
  max_value = Integer::MIN

  for k in (i..j - 1)
    min1, min2 = minimums[i][k], minimums[k + 1][j]
    max1, max2 = maximums[i][k], maximums[k + 1][j]
    v1, v2, v3, v4 =
      evaluate(min1, ops[k - 1], min2),
      evaluate(min1, ops[k - 1], max2),
      evaluate(max1, ops[k - 1], min2),
      evaluate(max1, ops[k - 1], max2)
    min_value = [min_value, v1, v2, v3, v4].min
    max_value = [max_value, v1, v2, v3, v4].max
  end
  [min_value, max_value]
end

def get_maximum_value(numbers, ops)
  n = numbers.size
  minimums = Array.new(n + 1) { Array.new(n + 1) }
  maximums = Array.new(n + 1) { Array.new(n + 1) }

  (1..n).to_a.each do |i|
    minimums[i][i] = numbers[i - 1]
    maximums[i][i] = numbers[i - 1]
  end

  for s in (1..n - 1)
    for i in (1..n - s)
      j = i + s
      minimums[i][j], maximums[i][j] = minmax(minimums, maximums, ops, i, j)
    end
  end
  maximums[1][n]
end

if __FILE__ == $0
  str = gets.chomp
  numbers = []
  ops = []
  begin
    num, op, str = str.partition(/[\+\*\-]/)
    numbers << num.to_i
    ops << op unless op.empty?
  end until str.empty?
  pp get_maximum_value(numbers, ops)
end
