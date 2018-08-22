class Symbol
  def to_proc
    lambda { |*args|
      if args.size == 1
        args[0]
      else
        args[0].send(self, args[1])
      end
    }
  end
end
# 
# puts (1..10).reduce(&:*)
#
# puts (1..10).each(&:*)
