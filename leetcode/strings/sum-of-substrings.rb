# Input  : num = “1234”
# Output : 1670
# Sum = 1 + 2 + 3 + 4 + 12 + 23 +
#        34 + 123 + 234 + 1234
#     = 1670
#
# Input  : num = “421”
# Output : 491
# Sum = 4 + 2 + 1 + 42 + 21 + 421
#     = 491
#
# sum[i] = (i+1)*num[i] + 10*sum[i-1]

def sum_of_substrings(str)
  prev = str.chars[0].to_i
  sum = prev
  (1..str.size-1).to_a.each do |i|
    num = str.chars[i].to_i
    prev = (i + 1) * num + 10 * prev
    sum += prev
  end

  sum
end

input = gets.chomp
puts sum_of_substrings(input)
