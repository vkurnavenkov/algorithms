# Greatest common divisor
# gcd(54, 24) = 6
# gcd(18, 84) = 6
#
# Euclid's algorithm:
# gcd(a, 0) = a
# gcd(a, b) = gcd(b, a mod b)

def gcd(a, b)
  return a if b == 0
  div = a % b
  gcd(b, div)
end

a, b = gets.split().map(&:to_i).sort.reverse
puts "#{gcd(a, b)}"
