# Leetcode 123. Best Time to Buy and Sell Stock III
#
#
# Say you have an array for which the ith element is the price of a given stock on day i.
#
# Design an algorithm to find the maximum profit. You may complete at most two transactions.
#
# Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).
#
# Example 1:
#
# Input: [3,3,5,0,0,3,1,4]
# Output: 6
# Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
#              Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
# Example 2:
#
# Input: [1,2,3,4,5]
# Output: 4
# Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
#              Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
#              engaging multiple transactions at the same time. You must sell before buying again.
# Example 3:
#
# Input: [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transaction is done, i.e. max profit = 0.
#

# Solution 1
# runtime: O(n)
# space: O(n)
#
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    return 0 if prices.empty?

    n = prices.size
    dp = Array.new(n, 0)
    (1..2).each do |i|
        val = - prices[0]
        prev_val = dp[0]
        (1...n).each do |j|
            val = [val, - prices[j] + prev_val].max
            prev_val = dp[j]
            dp[j] = [dp[j - 1], prices[j] + val].max
        end
    end

    dp[n - 1]
end

# Solution 2
# runtime: O(n)
# space: O(1)
#

# @param {Integer[]} prices
# @return {Integer}
def max_profit_2(prices)
    return 0 if prices.empty?

    n = prices.size
    dp = Array.new(3, 0)
    max_val = Array.new(3, -prices[0])

    (1...n).each do |j|
        (1..2).each do |i|
            max_val[i] = [max_val[i], -prices[j] + dp[i - 1]].max
            dp[i] = [dp[i], prices[j] + max_val[i]].max
        end
    end


    dp[2]
end
