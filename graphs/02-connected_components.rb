class Graph
  def initialize
    @edges = Hash.new { |h, k| h[k] = [] }
    @visited = []
    @num_vertices = 0
  end

  def read_from_stdin
    @num_vertices, num_edges = STDIN.readline.split.map(&:to_i)
    num_edges.times do
      v1, v2 = STDIN.readline.split.map(&:to_i)
      @edges[v1] << v2
      @edges[v2] << v1
    end

    @visited = Array.new(@num_vertices, false)
  end

  def components_count
    def _process(vertix)
      return if @visited[vertix - 1]

      @visited[vertix - 1] = true
      @edges[vertix].any? do |v|
        _process(v) unless @visited[v - 1]
      end
    end

    @visited = Array.new(@num_vertices, false)
    result = 0
    @visited.each.with_index do |_, idx|
      next if @visited[idx]
      result += 1
      _process(idx + 1)
    end

    result
  end
end

graph = Graph.new
graph.read_from_stdin

puts graph.components_count
