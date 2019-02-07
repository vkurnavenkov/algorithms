# Leetcode 412. Fizz Buzz
#
# Write a program that outputs the string representation of numbers from 1 to n.
#
# But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”.
# For numbers which are multiples of both three and five output “FizzBuzz”.
#
# Example:
#
# n = 15,
#
# Return:
# [
#     "1",
#     "2",
#     "Fizz",
#     "4",
#     "Buzz",
#     "Fizz",
#     "7",
#     "8",
#     "Fizz",
#     "Buzz",
#     "11",
#     "Fizz",
#     "13",
#     "14",
#     "FizzBuzz"
# ]
#

def fizz_buzz(n)
    (1..n).map do |i|
        if i % 3 == 0 || i % 5 == 0
            val = ''
            val += 'Fizz' if i % 3 == 0
            val += 'Buzz' if i % 5 == 0
            val
        else
            i.to_s
        end
    end
end

puts fizz_buzz(15).to_s
