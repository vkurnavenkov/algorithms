require 'thread'

@mutex = Mutex.new
@arr = [ 1, 2, 3, 4, 5, 6, 7, 8 ]

def iterate(thread_number)
   while @arr.length > 0 do
     sleep 0.01
     @mutex.synchronize {
       if val = @arr.shift
         puts "#{val} - I am a thread number #{thread_number}"
       end
     }
   end
end

number_of_threads = 4

threads = []
number_of_threads.times do |t|
  threads[t] = Thread.new do
     iterate(t)
  end
end

threads.each {|t| t.join}
