# https://leetcode.com/discuss/interview-question/357345/uber-phone-screen-sum-to-100
#
# Add the mathematical operators + or - before any of the digits in the decimal numeric string 123456789
# such that the resulting mathematical expression adds up to 100. Return all possible solutions.
#

class Solution
  DIGITS = '123456789'

  def sum_to(value)
    results = []
    backtrack(0, value, results, [])
    results.map { |values| to_string(values) }
  end

  private

  def backtrack(left, value, results, current)
    if left == DIGITS.length
      results.push(current.clone) if value == 0
      return
    end

    (left...DIGITS.length).each do |i|
      val = DIGITS[left..i].to_i
      current.push(val)
      backtrack(i + 1, value - val, results, current)
      current.pop

      current.push(-val)
      backtrack(i + 1, value + val, results, current)
      current.pop
    end
  end

  def to_string(values)
    (0...values.size).reduce('') do |rv, i|
      if i == 0
        rv += values[i].to_s
      else
        rv += values[i] > 0 ? "+#{values[i]}" : values[i].to_s
      end
    end
  end
end

solution = Solution.new
puts solution.sum_to(100)
