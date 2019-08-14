# Leetcode 96. Unique Binary Search Trees
#
# Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?
#
# Example:
#
# Input: 3
# Output: 5
# Explanation:
# Given n = 3, there are a total of 5 unique BST's:
#
#    1         3     3      2      1
#     \       /     /      / \      \
#      3     2     1      1   3      2
#     /     /       \                 \
#    2     1         2                 3
#

# @param {Integer} n
# @return {Integer}
def num_trees(n)
    unique_trees = Array.new(n + 1, 0)
    unique_trees[0] = 1
    unique_trees[1] = 1
    (2..n).each do |i|
        (1..i).each do |j|
            unique_trees[i] += unique_trees[j - 1] * unique_trees[i - j]
        end
    end
    unique_trees[n]
end
