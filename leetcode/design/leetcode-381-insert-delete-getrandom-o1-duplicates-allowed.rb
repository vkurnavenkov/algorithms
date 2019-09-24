# Leetcode 381. Insert Delete GetRandom O(1) - Duplicates allowed
#
# Design a data structure that supports all following operations in average O(1) time.
#
# Note: Duplicate elements are allowed.
# insert(val): Inserts an item val to the collection.
# remove(val): Removes an item val from the collection if present.
# getRandom: Returns a random element from current collection of elements. The probability of each element being returned is linearly related to the number of same value the collection contains.
# Example:
#
# // Init an empty collection.
# RandomizedCollection collection = new RandomizedCollection();
#
# // Inserts 1 to the collection. Returns true as the collection did not contain 1.
# collection.insert(1);
#
# // Inserts another 1 to the collection. Returns false as the collection contained 1. Collection now contains [1,1].
# collection.insert(1);
#
# // Inserts 2 to the collection, returns true. Collection now contains [1,1,2].
# collection.insert(2);
#
# // getRandom should return 1 with the probability 2/3, and returns 2 with the probability 1/3.
# collection.getRandom();
#
# // Removes 1 from the collection, returns true. Collection now contains [1,2].
# collection.remove(1);
#
# // getRandom should return 1 and 2 both equally likely.
# collection.getRandom();
#

class RandomizedCollection
    attr_reader :hash, :values

=begin
    Initialize your data structure here.
=end
    def initialize()
        @hash = {}
        @values = []
    end


=begin
    Inserts a value to the collection. Returns true if the collection did not already contain the specified element.
    :type val: Integer
    :rtype: Boolean
=end
    def insert(val)
        hash[val] = Set.new unless hash[val]
        hash[val].add(values.size)
        values.push(val)
        hash[val].size == 1
    end


=begin
    Removes a value from the collection. Returns true if the collection contained the specified element.
    :type val: Integer
    :rtype: Boolean
=end
    def remove(val)
        return false if !hash[val] || hash[val].empty?

        # Update values array
        idx = hash[val].first
        last = values[-1]
        values[idx] = last

        # Remove last from array
        values.pop

        # Remove val
        hash[val].delete(idx)

        # Update last
        hash[last].add(idx)
        hash[last].delete(values.size)

        true
    end


=begin
    Get a random element from the collection.
    :rtype: Integer
=end
    def get_random()
        values[rand(values.size)]
    end
end

# Your RandomizedCollection object will be instantiated and called as such:
# obj = RandomizedCollection.new()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.get_random()
