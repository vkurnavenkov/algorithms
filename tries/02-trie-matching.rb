class Trie
  def initialize
    @nodes = [{}]
  end

  def insert(pattern)
    cur_idx = 0
    pattern.chars.each do |c|
      edges = @nodes[cur_idx]
      if edges[c]
        cur_idx = edges[c]
      else
        @nodes.push({})
        cur_idx = @nodes.size - 1
        edges[c] = cur_idx
      end
    end
    @nodes[cur_idx][:leaf] = true
    @nodes
  end

  def match_text(text)
    result = []
    text.size.times do |idx|
      rv = match(text[idx..-1])
      # puts "#{text[idx..-1]} -> #{rv}"
      result.push(idx) if rv
    end

    result
  end

  private

  def match(text)
    cur_idx = 0
    text.chars do |c|
      return true if @nodes[cur_idx][:leaf]
      next_idx = @nodes[cur_idx][c]
      return false unless next_idx
      cur_idx = next_idx
    end

    @nodes[cur_idx][:leaf]
  end
end

list = Trie.new

text = STDIN.readline.chomp
n = STDIN.gets.chomp.to_i
n.times do
  pattern = STDIN.readline.chomp
  list.insert(pattern)
end
puts list.match_text(text).join(' ')
# list.insert('ATCG')
# list.insert('GGGT')
#
# puts list.match_text('AATCGGGTTCAATCGGGGT').join(' ')
# puts list.match('ATCGGGTTCAATCGGGGT')
# list.print
