#!/usr/bin/env ruby

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
  values[capacity][weights.size]
end

capacity, _, *weights = STDIN.read.split.map(&:to_i)
puts knapsack(capacity, weights)
