def reverse_integer(n)
  negative = false
  tmp = n
  result = 0
  if tmp < 0
    negative = true
    tmp = -tmp
  end
  while tmp > 0
    d = tmp % 10
    tmp /= 10
    result = result * 10 + d
    # (result - d) / 10 != tmp -> overflow
  end
  negative ? -result : result
end

puts reverse_integer(123456) # 654321
puts reverse_integer(-3456) # -6543
