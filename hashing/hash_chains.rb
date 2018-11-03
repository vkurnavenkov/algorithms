# Coursera
#
class CustomHash
  def initialize(size)
    @data = Array.new(size) { Array.new }
  end

  def process(action, param)
    case action
    when 'add'
      add_string(param)
      nil
    when 'del'
      del_string(param)
      nil
    when 'check'
      check_index(param.to_i)
    when 'find'
      find_string(param) ? 'yes' : 'no'
    end
  end

  private

  def index(str)
    p = 1_000_000_007
    x = 263
    result = 0
    bytes = str.bytes
    (bytes.size - 1).downto(0).to_a.each do |idx|
      result = (result * x + bytes[idx]) % p
    end

    result % @data.size
  end

  def add_string(str)
    # puts "Adding:"
    idx = index(str)
    # puts "index: #{idx}"
    @data[idx].unshift(str) unless index_in_chain(idx, str)
    # puts "#{@data}"
  end

  def del_string(str)
    # puts "Deleting:"
    idx = index(str)
    # puts "index: #{idx}"
    @data[idx].delete(str)
    # puts "#{@data}"
  end

  def find_string(str)
    idx = index(str)
    index_in_chain(idx, str) != nil
  end

  def check_index(idx)
    return nil if idx < 0 || idx >= @data.size
    @data[idx].join(' ')
  end

  def index_in_chain(idx, str)
    @data[idx].index(str)
  end
end

# size = 5
# queries = [
#   ['add', 'world'],
#   ['add', 'HellO'],
#   ['check', 4],
#   ['find', 'World'],
#   ['find', 'world'],
#   ['del', 'world'],
#   ['check', 4],
#   ['del', 'HellO'],
#   ['add', 'luck'],
#   ['add', 'GooD'],
#   ['check', 2],
#   ['del', 'good']
# ]

# Input
size, _, *raw_data = STDIN.read.chomp.split(/\s+/)
size = size.to_i
queries = raw_data.each_slice(2).to_a.map { |action, param| [action, param] }

# Process and Output
hash = CustomHash.new(size)
queries.each do |q|
  rv = hash.process(q[0], q[1])
  # puts "Params: #{q}, output: #{rv.inspect}"
  puts rv if rv
end
