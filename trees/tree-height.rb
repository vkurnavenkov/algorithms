#!/usr/bin/env ruby
# fails on large input (time-consuming)

def tree_height(nodes)
  root_idx = nodes.index(-1) ? -1 : 0
  height = 0
  heights = Array.new(nodes.size, nil)
  stack = []
  (0..nodes.size-1).each do |vertex|
    h = 0
    idx = vertex
    while idx != root_idx # && !heights[idx]
      stack.push(idx)
      idx = nodes[idx]
      puts "Idx: #{idx}, Stack size: #{stack.size}"
    end
    h = idx == root_idx ? 0 : heights[idx] || 0
    until stack.empty?
      idx = stack.pop
      h += 1
      heights[idx] = h
    end
    height = h if h > height
  end

  height
end

_, *nodes = STDIN.read.split.map(&:to_i)

puts "Root is: #{nodes.index(-1)}"

puts tree_height(nodes)
