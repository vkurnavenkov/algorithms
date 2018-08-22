# Write a program which prints out all numbers between 1 and 100.
# When the program would print out a number exactly divisible by 4, print "Linked" instead.
# When it would print out a number exactly divisible by 6, print "In" instead.
# When it would print out a number exactly divisible by both 4 and 6, print "LinkedIn" instead.

def print_numbers
  (1..100).each do |n|
    n4 = n % 4 == 0
    n6 = n % 6 == 0
    if n4 || n6
      if n4
        print "Linked"
      end
      if n6
        print "In"
      end
      print "\n"
    else
      puts n
    end
  end
end

print_numbers
