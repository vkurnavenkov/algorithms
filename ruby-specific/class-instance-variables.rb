class Foo
  @inst_var = 1

  def self.inst_var
    @inst_var
  end

  def self.inst_var=(value)
    @inst_var = value
  end
end

class Bar < Foo

end

puts Foo.inst_var # 1
puts Bar.inst_var # nil

Bar.inst_var = 123

puts Foo.inst_var # 1
puts Bar.inst_var # 123
