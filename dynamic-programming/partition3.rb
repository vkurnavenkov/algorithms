#!/usr/bin/env ruby
require 'pp'

# Solution based on knapsack algorithm (long)
def knapsack(capacity, weights)
  values = Array.new(capacity + 1) { Array.new(weights.size + 1, 0) }
  (1..capacity).to_a.each do |w|
    (1..weights.size).to_a.each do |i|
      values[w][i] = values[w][i - 1]
      if weights[i - 1] <= w
        values[w][i] = [values[w][i], values[w - weights[i - 1]][i - 1] + weights[i - 1]].max
      end
    end
  end
  usage = backtrace(values, weights)
  updated_weights = weights.each.with_index.reduce([]) do |rv, (w, idx)|
    usage[idx] == 0 ? rv + [w] : rv
  end

  [values[capacity][weights.size], updated_weights]
end

# Backtraces values matrix and return array of 0 / 1, where 1 if weight is used
def backtrace(values, weights)
  results = Array.new(weights.size)
  w = values.size - 1
  i = weights.size
  while i >= 1
    if values[w][i] == values[w][i - 1]
      results[i - 1] = 0
    else
      results[i - 1] = 1
      w -= weights[i - 1]
    end
    i -= 1
  end

  results
end

def partition3_long(weights)
  sum = weights.reduce(:+)
  return 0 unless sum % 3 == 0

  capacity = sum / 3
  i = 0
  begin
    i += 1
    size, weights = knapsack(capacity, weights)
  end while i < 3 && size == capacity

  size == capacity ? 1 : 0
end

# Updated solution
def partition3(weights)
  sum = weights.reduce(:+)
  return false unless sum % 3 == 0

  capacity = sum / 3
  w_size = weights.size
  flags = Array.new(capacity + 1) { Array.new(capacity + 1) { Array.new(w_size + 1, 0) } }
  flags[0][0][0] = true
  for i in (1..capacity)
    for j in (1..capacity)
      flags[i][j][0] = false
    end
  end

  for i in (1..capacity)
    for j in (1..capacity)
      for k in (1..w_size)
        flags[i][j][k] = flags[i][j][k - 1]
        if weights[k - 1] <= i && weights[k - 1] <= j
          flags[i][j][k] = flags[i][j][k] || flags[i - weights[k - 1]][j][k] || flags[i][j - weights[k - 1]][k]
        end
      end
    end
  end

  flags[capacity][capacity][w_size]
end

_, *weights = STDIN.read.split.map(&:to_i)
puts(partition3(weights) ? 1 : 0)
