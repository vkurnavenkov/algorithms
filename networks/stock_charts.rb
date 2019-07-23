# Task.
# You’re in the middle of writing your newspaper’s end-of-year economics summary,
# and you’ve decided that you want to show a number of charts to demonstrate
# how different stocks have performed over the course of the last year.
# You’ve already decided that you want to show the price of 𝑛 different stocks,
# all at the same 𝑘 points of the year.
# A simple chart of one stock’s price would draw lines between the points
# (0, 𝑝𝑟𝑖𝑐𝑒0), (1, 𝑝𝑟𝑖𝑐𝑒1), . . . , (𝑘 − 1,𝑝𝑟𝑖𝑐𝑒𝑘−1),
# where 𝑝𝑟𝑖𝑐𝑒𝑖 is the price of the stock at the 𝑖-th point in time.
# In order to save space, you have invented the concept of an overlaid chart.
# An overlaid chart is the combination of one or more simple charts,
# and shows the prices of multiple stocks (simply drawing a line for each one).
# In order to avoid confusion between the stocks shown in a chart,
# the lines in an overlaid chart may not cross or touch.
# Given a list of 𝑛 stocks’ prices at each of 𝑘 time points,
# determine the minimum number of overlaid charts you need to show all of the stocks’ prices.
#

class StockCharts
  attr_reader :stock_data

  def initialize(stock_data)
    @stock_data = stock_data
  end

  def solve
    adj_matrix = build_matrix(stock_data)

    paths = 0
    stocks = stock_data.size
    matched_left = Array.new(stocks)
    matched_right = Array.new(stocks)

    stocks.times do |i|
      paths += 1 if dfs(i, adj_matrix, matched_left, matched_right, Array.new(stocks, false))
    end

    # The path means that we can place linked stocks together
    stocks - paths
  end

  private

  # Build a matrix with available paths (true - no intersection b/w 2 stock charts)
  def build_matrix(stock_data)
    stocks = stock_data.size
    points = stock_data[0].size

    result = Array.new(stocks) { Array.new(stocks, false) }

    stocks.times do |i|
      stocks.times do |j|
        next if i == j

        result[i][j] = true
        points.times do |k|
          result[i][j] &&= stock_data[i][k] < stock_data[j][k]
          break unless result[i][j]
        end
      end
    end

    # stocks.times do |i|
    #   puts result[i].to_s
    # end

    result
  end

  # u -> v
  def dfs(u, adj_matrix, matched_left, matched_right, visited)
    return false if visited[u]

    visited[u] = true
    size = adj_matrix.size
    size.times do |v|
      next unless adj_matrix[u][v]

      if matched_right[v].nil? || dfs(matched_right[v], adj_matrix, matched_left, matched_right, visited)
        matched_left[u] = v
        matched_right[v] = u
        return true
      end
    end

    false
  end
end

def read_from_input
  n, k = STDIN.readline.split.map(&:to_i)
  stock_data = []
  n.times do
    values = STDIN.readline.split.map(&:to_i)
    stock_data.push(values)
  end

  stock_data
end

# Result: 2
def sample_data_1
  [
    [1, 2, 3, 4],
    [2, 3, 4, 6],
    [6, 5, 4, 3]
  ]
end

# Result: 3
def sample_data_2
  [
    [5, 5, 5],
    [4, 4, 6],
    [4, 5, 4]
  ]
end

stock_data = read_from_input
# stock_data = sample_data_2
solution = StockCharts.new(stock_data)
puts solution.solve
