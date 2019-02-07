# https://www.toptal.com/ruby/ruby-concurrency-and-parallelism-a-practical-primer

require 'benchmark'

class Mailer

  def self.deliver(&block)
    mail = MailBuilder.new(&block).mail
    mail.send_mail
  end

  Mail = Struct.new(:from, :to, :subject, :body) do
    def send_mail
      fib(30)
      puts "Email from: #{from}"
      puts "Email to  : #{to}"
      puts "Subject   : #{subject}"
      puts "Body      : #{body}"
    end

    def fib(n)
      n < 2 ? n : fib(n-1) + fib(n-2)
    end
  end

  class MailBuilder
    def initialize(&block)
      @mail = Mail.new
      instance_eval(&block)
    end

    attr_reader :mail

    %w(from to subject body).each do |m|
      define_method(m) do |val|
        @mail.send("#{m}=", val)
      end
    end
  end
end

puts "=== Regular: ==="
puts Benchmark.measure {
  100.times do |i|
    Mailer.deliver do
      from    "eki_#{i}@eqbalq.com"
      to      "jill_#{i}@example.com"
      subject "Threading and Forking (#{i})"
      body    "Some content"
    end
  end
}

puts "=== Multiple Processes: ==="
puts Benchmark.measure {
  100.times do |i|
    fork do
      Mailer.deliver do
        from    "eki_#{i}@eqbalq.com"
        to      "jill_#{i}@example.com"
        subject "Threading and Forking (#{i})"
        body    "Some content"
      end
    end
  end
  Process.waitall
}

puts "=== Multithreading: ==="
threads = []
puts Benchmark.measure {
  100.times do |i|
    threads << Thread.new do
      Mailer.deliver do
        from    "eki_#{i}@eqbalq.com"
        to      "jill_#{i}@example.com"
        subject "Threading and Forking (#{i})"
        body    "Some content"
      end
    end
  end
  threads.map(&:join)
}

puts "=== Thread Pooling: ==="
require 'thread'
POOL_SIZE = 10

jobs = Queue.new

10_0000.times{|i| jobs.push i}

workers = (POOL_SIZE).times.map do
  Thread.new do
    begin
      while x = jobs.pop(true)
        Mailer.deliver do
          from    "eki_#{x}@eqbalq.com"
          to      "jill_#{x}@example.com"
          subject "Threading and Forking (#{x})"
          body    "Some content"
        end
      end
    rescue ThreadError
    end
  end
end

workers.map(&:join)
