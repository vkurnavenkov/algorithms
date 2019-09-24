def max_sum(stack1, stack2, stack3)
  sum1 = stack1.reduce(:+)
  sum2 = stack2.reduce(:+)
  sum3 = stack3.reduce(:+)
  while !stack1.empty? && !stack2.empty? && !stack3.empty?
    return sum1 if sum1 == sum2 && sum2 == sum3
    if sum1 > sum2 && sum1 > sum3
      sum1 -= stack1.pop
    elsif sum2 > sum1 && sum2 > sum3
      sum2 -= stack2.pop
    else
      sum3 -= stack3.pop
    end
  end
  0
end

puts max_sum([3, 10], [4, 5], [2, 1]) # 0
puts max_sum([3, 2, 1, 1, 1], [4, 3, 2], [1, 1, 4, 1]) # 7
