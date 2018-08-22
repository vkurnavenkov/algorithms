#!/usr/bin/env ruby

def minimum_operations(v)
  buffer = Array.new(v + 1, 0)
  n = 2

  while n <= v
    min = buffer[n - 1]
    if n % 2 == 0
      min = [min, buffer[n / 2]].min
    end
    if n % 3 == 0
      min = [min, buffer[n / 3]].min
    end
    buffer[n] = min + 1
    n += 1
  end

  result = Array.new(buffer[v] + 1)
  n = v
  i = result.size - 1
  while n > 0
    result[i] = n
    if n % 2 == 0 && n % 3 == 0
      n /= 3
    elsif n % 3 == 0
      if buffer[n - 1] < buffer[ n / 3 ]
        n -= 1
      else
        n /= 3
      end
    elsif n % 2 == 0
      if buffer[n - 1] < buffer[ n / 2 ]
        n -= 1
      else
        n /= 2
      end
    else
      n -= 1
    end
    i -= 1
  end

  result
end

if __FILE__ == $0
  n = gets.to_i
  answer = minimum_operations(n)
  puts answer.length - 1
  puts answer.join(' ')
end
