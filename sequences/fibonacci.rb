# Returns Nth Fibonacci number
#

def fibonacci(n)
  return 0 if n < 1
  return 1 if n == 1
  prev = 0
  cur = 1
  (2..n).each do
    cur, prev = cur + prev, cur
  end
  cur
end

fib = Enumerator.new do |y|
  a, b = 1, 1
  loop do
    y << a
    a, b = b, a + b
  end
end

puts fibonacci(0) # 0
puts fibonacci(1) # 1
puts fibonacci(2) # 1
puts fibonacci(3) # 2
puts fibonacci(4) # 3
puts fibonacci(5) # 5
puts fibonacci(6) # 8
puts fibonacci(7) # 13
puts fibonacci(8) # 21
puts fibonacci(9) # 34
puts fibonacci(10) # 55

puts fib.take(10).to_s
