# LeetCode 269. Alien Dictionary
# https://leetcode.com/problems/alien-dictionary/
#

class Solution
    NODES = 26

    def solve(words)
        graph = build_graph(words)
        # puts graph.map(&:inspect)
        return '' if is_acyclic?(graph)

        chars = topo_sort(graph)
        chars.join
    end

    private

    def build_graph(words)
        graph = Array.new(NODES)
        init_nodes(graph, words)
        (1...words.size).each do |i|
            add_edges(graph, words[i - 1], words[i])
        end
        graph
    end

    def init_nodes(graph, words)
        words.each do |word|
            word.chars.each do |c|
                idx = char_to_idx(c)
                graph[idx] = Set.new unless graph[idx]
            end
        end
    end

    def add_edges(graph, word1, word2)
        len = [word1.length, word2.length].min
        len.times do |i|
            next if word1[i] == word2[i]

            graph[char_to_idx(word2[i])].add(char_to_idx(word1[i]))
            break
        end
    end

    def is_acyclic?(graph)
        visited = Set.new
        rec_stack = Set.new
        (0...graph.size).each do |i|
            return true if acyclic_dfs(graph, i, visited, rec_stack)
        end
        false
    end

    def acyclic_dfs(graph, idx, visited, rec_stack)
        return if visited.include?(idx)
        visited.add(idx)
        rec_stack.add(idx)

        graph[idx].to_a.each do |i|
            return true if rec_stack.include?(i) || acyclic_dfs(graph, i, visited, rec_stack)
        end
        rec_stack.delete(idx)
        false
    end

    def topo_sort(graph)
        visited = Set.new
        result = []
        (0...graph.size).each do |i|
            next unless graph[i]

            topo_dfs(graph, i, visited, result) unless visited.include?(i)
        end
        result.map { |i| idx_to_char(i) }
    end

    def topo_dfs(graph, idx, visited, result)
        visited.add(idx)
        graph[idx].to_a.each do |i|
            visited.include?(i) || topo_dfs(graph, i, visited, result)
        end
        result.push(idx)
    end

    def char_to_idx(char)
        char.ord - 'a'.ord
    end

    def idx_to_char(idx)
        (idx + 'a'.ord).chr
    end
end

# @param {String[]} words
# @return {String}
def alien_order(words)
    Solution.new.solve(words)
end
