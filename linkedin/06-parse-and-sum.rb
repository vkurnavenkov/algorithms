def parse_and_sum(str)
  numbers = str.scan(/(-?\d+(\.\d+)?)/) # [["123", nil], ["-1123", nil], ["3", nil], ["32.56", ".56"]]
  numbers.reduce(0) { |rv, v| rv += v.first.to_f }
end

puts parse_and_sum('asd123dfg-1123ghgj3,32.56') # -964.44
