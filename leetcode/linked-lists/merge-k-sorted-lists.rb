# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists_2(lists)
  head = nil
  tail = nil
  begin
    idx = nil
    lists.each.with_index do |list, i|
      next unless list
      idx = i if idx == nil || list.val < lists[idx].val
    end
    if idx
      node = lists[idx]
      lists[idx] = lists[idx].next
      node.next = nil
      if head
        tail.next = node
        tail = tail.next
      else
        head = node
        tail = node
      end
    end
  end while idx
  head
end

# Solution 2

class PriorityQueue
    def initialize
        @queue = []
    end

    def push(value, node)
        @queue.push([value, node])
        sift_up(@queue.size - 1)
        # puts @queue.map{|val, _| val}.to_s
    end

    def extract
        return nil if empty?
        result = @queue[0]
        if @queue.size > 1
            @queue[0] = @queue.pop
            sift_down(0)
        else
            @queue.pop
        end
        result
    end

    def empty?
        @queue.empty?
    end

    private

    def sift_up(idx)
        # return if idx <= 0
        # p_idx = parent_idx(idx)
        while idx > 0 && @queue[parent_idx(idx)].first > @queue[idx].first
            @queue[parent_idx(idx)], @queue[idx] = @queue[idx], @queue[parent_idx(idx)]
            idx = parent_idx(idx)
        end
    end

    def sift_down(idx)
        return if idx >= @queue.size
        min_idx = idx
        if left_idx(idx) < @queue.size && @queue[min_idx].first > @queue[left_idx(idx)].first
            min_idx = left_idx(idx)
        end
        if right_idx(idx) < @queue.size && @queue[min_idx].first > @queue[right_idx(idx)].first
            min_idx = right_idx(idx)
        end
        if min_idx != idx
            @queue[min_idx], @queue[idx] = @queue[idx], @queue[min_idx]
            sift_down(min_idx)
        end
    end

    def parent_idx(idx)
        (idx - 1) / 2
    end

    def left_idx(idx)
        idx * 2 + 1
    end

    def right_idx(idx)
        idx * 2 + 2
    end
end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
    head = nil
    tail = nil
    heap = PriorityQueue.new
    lists.each { |list| heap.push(list.val, list) if list }
    begin
        _, node = heap.extract
        if node
            new_node = ListNode.new(node.val)
            heap.push(node.next.val, node.next) if node.next
            if head
                tail.next = new_node
                tail = tail.next
            else
                head = new_node
                tail = new_node
            end
        end
    end until heap.empty?
    head
end
