# LeetCode 273. Integer to English Words
# https://leetcode.com/problems/integer-to-english-words/
#
# Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.
#
# Example 1:
#
# Input: 123
# Output: "One Hundred Twenty Three"
# Example 2:
#
# Input: 12345
# Output: "Twelve Thousand Three Hundred Forty Five"
# Example 3:
#
# Input: 1234567
# Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
# Example 4:
#
# Input: 1234567891
# Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
#

class Solition
    ONES = [
        'Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine',
        'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen',
        'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'
    ]
    TENS = [
        '', 'Ten', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'
    ]
    GROUPS = ['', 'Thousand', 'Million', 'Billion', 'Trillion']

    def solve(num)
        return ONES[num] if num < 10

        result = ''
        group = 0
        while num > 0
            val = num % 1000
            out = ''
            if val > 0
                out = hundrends(val)
                out += " #{GROUPS[group]}" unless GROUPS[group].empty?
                result = result.empty? ? out : "#{out} #{result}"
            end
            num /= 1000
            group += 1
        end

        result
    end

    private

    def hundrends(num)
        rv = ''
        hundrend = num / 100
        ten = num % 100
        if hundrend > 0 && ten > 0
            rv = "#{ones(hundrend)} Hundred #{tens_and_ones(ten)}"
        elsif hundrend > 0
            rv = "#{ones(hundrend)} Hundred"
        elsif ten > 0
            rv = tens_and_ones(ten)
        end

        rv
    end

    def tens_and_ones(num)
        num %= 100
        return '' if num == 0
        return ONES[num] if num < 20

        ten = num / 10
        one = num % 10
        if ten > 0 && one > 0
            "#{TENS[ten]} #{ones(one)}"
        elsif ten > 0
            TENS[ten]
        else
            ones(one)
        end
    end

    def ones(num)
        num %= 10
        return '' if num == 0

        ONES[num]
    end
end

# @param {Integer} num
# @return {String}
def number_to_words(num)
    Solition.new.solve(num)
end
