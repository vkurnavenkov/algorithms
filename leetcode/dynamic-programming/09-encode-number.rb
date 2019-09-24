# Given a mapping between numbers and alphabets.
# Find the number of ways to decode a sequence of numbers
#
# Examples: a - 21 b - 2 c - 54 d - 5 e -4 f-1
#   2154
#   1) ac
#   2) ade
#   3) bfc
#   4) bfde
#   4 ways to decode

def count_decode(number, map)
  counts = Array.new(number.size + 1, 0)
  counts[0] = 1
  (1..number.size).each do |i|
    map.values.each do |substr|
      len = substr.size
      counts[i] += counts[i - len] if i - len >= 0 && number[i - len, len] == substr
    end
  end
  puts counts.to_s
  counts[number.size]
end

map = {
  'a' => '21',
  'b' => '2',
  'c' => '54',
  'd' => '5',
  'e' => '4',
  'f' => '1'
}

puts count_decode('2154', map) # 4
puts count_decode('21541', map) # 4
puts count_decode('2156', map) # 0
puts count_decode('1154', map) # 2
