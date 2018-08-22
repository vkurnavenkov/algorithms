Edge = Struct.new(:text, :label)

class Trie
  def initialize
    @list = Hash.new { |h, k| h[k] = [] }
    @node_idx = 0
  end

  def add_string(str)
    edges = @list[0]
    str.chars.each do |c|
      edge = find_or_create_edge(c, edges)
      edges = @list[edge.label]
    end
    @list
  end

  def find_or_create_edge(c, edges)
    edge = edges.find { |e| e.text == c }
    unless edge
      edge = Edge.new(c, @node_idx += 1)
      edges.push(edge)
    end
    edge
  end

  def print
    (0..@list.size - 1).each do |label|
      edges = @list[label]
      edges.each do |edge|
        puts "#{label}->#{edge.label}:#{edge.text}"
      end
    end
  end
end

list = Trie.new
n = STDIN.gets.chomp.to_i
n.times do
  text = STDIN.readline.chomp
  list.add_string(text)
end
# list.add_string('AT')
# list.add_string('AG')
# list.add_string('AC')
list.print
