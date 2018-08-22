#!/usr/bin/env ruby

def max_pairwise_product(data)
  return 0 if data.size <= 1
  idx1, idx2 = data[0] > data[1] ? [0, 1] : [1, 0]
  (2..data.size-1).to_a.each do |i|
    if data[i] > data[idx1]
      idx2 = idx1
      idx1 = i
    elsif data[i] > data[idx2]
      idx2 = i
    end
  end

  data[idx1] * data[idx2]
end

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_i)
  n = data[0]
  a = data[1..n]
  puts "#{max_pairwise_product(a)}"
end
