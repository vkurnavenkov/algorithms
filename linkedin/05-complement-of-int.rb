def complement(n)
  bits = 0
  n2  = n
  while n2 > 0
    n2 >>= 1
    bits += 1
  end

  ((1 << bits) - 1) ^ n
end

puts complement(5) # 2
puts complement(11) # 4
