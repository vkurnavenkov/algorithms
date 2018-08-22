# Least common multiple
# lcm(4, 6) = 12
# lcm(a, b) = |a*b| / gcd(a, b)

def gcd(a, b)
  return a if b == 0
  div = a % b
  gcd(b, div)
end

def lcm(a, b)
  a, b = b, a if a < b
  a * b / gcd(a, b)
end

a, b = gets.split().map(&:to_i)
puts "#{lcm(a, b)}"
