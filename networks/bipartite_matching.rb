# The first line of the input contains integers 𝑛 and 𝑚 — the number of flights and the number of crews respectively.
# Each of the next 𝑛 lines contains 𝑚 binary integers (0 or 1).
# If the 𝑗-th integer in the 𝑖-th line is 1, then the crew number 𝑗 can work on the flight number 𝑖,
# and if it is 0, then it cannot.
#
# Sample:
# Input:
# 3 4
# 1 1 0 1
# 0 1 0 0
# 0 0 0 0
#
# Output:
# 1 2 -1
#

class MaxMatching
  def initialize(adj_matrix)
    @adj_matrix = adj_matrix
  end

  def find_matching
    matched_left = Array.new(@adj_matrix.size, -1)
    matched_right = Array.new(@adj_matrix[0].size, -1)

    @adj_matrix.size.times do |i|
      visited = Array.new(@adj_matrix.size, false)
      dfs(@adj_matrix, i, matched_left, matched_right, visited)
    end

    matched_left.map { |val| val == -1 ? val : val + 1 }
  end

  private

  def dfs(adj_matrix, u, matched_left, matched_right, visited)
    return false if visited[u]

    visited[u] = true
    # u -> v
    adj_matrix[0].size.times do |v|
      if adj_matrix[u][v] == 1
        # visited[v] = true
        if matched_right[v] == -1 || dfs(adj_matrix, matched_right[v], matched_left, matched_right, visited)
          matched_right[v] = u
          matched_left[u] = v
          return true
        end
      end
    end

    false
  end
end

def read_from_input
  n, m = gets.split.map(&:to_i)
  adj_matrix = Array.new(n)
  n.times do |i|
    adj_matrix[i] = gets.split.map(&:to_i)
  end

  adj_matrix
end

def sample_input_1
  [
    [1, 1, 0, 1],
    [0, 1, 0, 0],
    [0, 0, 0, 0]
  ]
end

def sample_input_2
  [
    [1, 1],
    [1, 0]
  ]
end

adj_matrix = read_from_input
# adj_matrix = sample_input_1 # -> 1 2 -1
# adj_matrix = sample_input_2 # -> 2 1

max_matching = MaxMatching.new(adj_matrix)
puts max_matching.find_matching.join(' ')
