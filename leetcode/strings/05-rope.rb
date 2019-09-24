class Rope
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def process(i, j, k)
    substr = @str.slice!(i..j)
    @str.insert(k, substr)
  end
end

str = STDIN.readline.chomp
rope = Rope.new(str)
n = STDIN.readline.to_i
n.times do
  i, j, k = STDIN.readline.split.map(&:to_i)
  rope.process(i, j, k)
end

puts rope.str
