class Foo
  @@class_var = 1

  def self.class_var
    @@class_var
  end

  def self.class_var=(value)
    @@class_var = value
  end
end

class Bar < Foo

end

puts Foo.class_var # 1
puts Bar.class_var # 1

Foo.class_var = 123

puts Foo.class_var # 123
puts Bar.class_var # 123
