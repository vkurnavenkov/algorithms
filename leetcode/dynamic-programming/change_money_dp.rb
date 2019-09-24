#!/usr/bin/env ruby

def get_change(coins, v)
  buffer = Array.new(v + 1)
  buffer[0] = 0

  coins.each do |coin|
    n = coin
    while n < buffer.size
      buffer[n] = buffer[n] == nil ? buffer[n - coin] + 1 : [buffer[n], buffer[n - coin] + 1].min
      n += 1
    end
  end

  buffer[v]
end

v = gets.to_i

puts(get_change([1, 3, 4], v))
