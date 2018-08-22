
class Person
  @@count = 0

  def initialize
    @@count += 1
    ObjectSpace.define_finalizer(self, self.class.finalize)
  end

  def self.count
    @@count
  end

  def self.decrease_count
    @@count -= 1
  end

  def self.finalize
    proc { decrease_count }
  end

end

# ObjectSpace.define_finalizer(Person, proc { |id| puts ObjectSpace._id2ref(id).decrease_count })

# Implement the Person class so that it can keep track of how many people get instantiated.
# For bonus points make it lower the count when instantiated people are garbage collected.

a = Person.new

puts "1 person should exist. #{Person.count} person exists."

b = Person.new

puts "2 people should exist. #{Person.count} people exist."

c = Person.new

puts "3 people should exist. #{Person.count} people exist."

a = nil
GC.start
puts "2 people should exist. #{Person.count} people exist."
