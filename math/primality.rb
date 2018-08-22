def prime_naive(n)
  return false if n < 2

  sqrt = Math.sqrt(n)
  for i in 2..sqrt
    return false if n % i == 0
  end
  true
end

puts prime_naive(3) # true
puts prime_naive(1) # false
puts prime_naive(8) # false
puts prime_naive(39) # true
