class Integer
  def reverse
    result = 0
    number = self
    result, number = (number % 10 + result * 10), number / 10 until number == 0
    result
  end
end

puts 123456.reverse # 654321
