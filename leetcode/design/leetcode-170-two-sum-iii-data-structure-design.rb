# LeetCode 170. Two Sum III - Data structure design
#
# Design and implement a TwoSum class. It should support the following operations: add and find.
#
# add - Add the number to an internal data structure.
# find - Find if there exists any pair of numbers which sum is equal to the value.
#
# Example 1:
#
# add(1); add(3); add(5);
# find(4) -> true
# find(7) -> false
# Example 2:
#
# add(3); add(1); add(2);
# find(3) -> true
# find(6) -> false
#

class TwoSum

=begin
    Initialize your data structure here.
=end
    def initialize()
        @map = {}
    end


=begin
    Add the number to an internal data structure..
    :type number: Integer
    :rtype: Void
=end
    def add(number)
        if @map.key?(number)
            @map[number] += 1
        else
            @map[number] = 1
        end
    end


=begin
    Find if there exists any pair of numbers which sum is equal to the value.
    :type value: Integer
    :rtype: Boolean
=end
    def find(value)
        @map.keys.each do |v|
            diff = value - v
            if @map.key?(diff)
                return true if v != diff || @map[value - v] > 1
            end
        end

        false
    end


end

# Your TwoSum object will be instantiated and called as such:
# obj = TwoSum.new()
# obj.add(number)
# param_2 = obj.find(value)
