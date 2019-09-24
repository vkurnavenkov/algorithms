class Graph
  def initialize
    @edges = Hash.new { |h, k| h[k] = [] }
  end

  def read_from_stdin
    @num_vertices, num_edges = STDIN.readline.split.map(&:to_i)
    num_edges.times do
      v1, v2 = STDIN.readline.split.map(&:to_i)
      # Undirected graph
      @edges[v1] << v2
      @edges[v2] << v1
    end
  end

  def bfs(src, colors)
    queue = [src]
    colors[src - 1] = 1

    until queue.empty?
      v = queue.shift
      @edges[v].each do |u|
        if colors[u - 1] == -1
          colors[u - 1] = 1 - colors[v - 1]
          queue.push(u)
        else
          return false if colors[u - 1] == colors[v - 1]
        end
      end
    end

    true
  end

  def is_bipartite?
    colors = Array.new(@num_vertices)
    colors.fill(-1)

    @num_vertices.times do |v|
      if colors[v] == -1
        return false unless bfs(v + 1, colors)
      end
    end

    true
  end
end

graph = Graph.new
graph.read_from_stdin

puts graph.is_bipartite? ? 1 : 0
