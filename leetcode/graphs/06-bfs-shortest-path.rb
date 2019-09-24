class Graph
  def initialize
    @edges = Hash.new { |h, k| h[k] = [] }
  end

  def read_from_stdin
    num_vertices, num_edges = STDIN.readline.split.map(&:to_i)
    num_edges.times do
      v1, v2 = STDIN.readline.split.map(&:to_i)
      # Undirected graph
      @edges[v1] << v2
      @edges[v2] << v1
    end

    @dist = Array.new(num_vertices)
  end

  def bfs(src, dest)
    @dist.fill(-1)
    queue = [src]
    @dist[src - 1] = 0

    until queue.empty?
      v = queue.shift
      @edges[v].each do |u|
        if @dist[u - 1] == -1
          queue.push(u)
          @dist[u - 1] = @dist[v - 1] + 1
        end
      end
    end

    @dist[dest - 1]
  end
end

graph = Graph.new
graph.read_from_stdin
src, dest = STDIN.readline.split.map(&:to_i)

puts graph.bfs(src, dest)
