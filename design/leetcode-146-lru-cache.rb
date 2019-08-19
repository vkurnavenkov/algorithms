# Leetcode 146. LRU Cache
#
# Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
#
# get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
# put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
#
# The cache is initialized with a positive capacity.
#
# Follow up:
# Could you do both operations in O(1) time complexity?
#
# Example:
#
# LRUCache cache = new LRUCache( 2 /* capacity */ );
#
# cache.put(1, 1);
# cache.put(2, 2);
# cache.get(1);       // returns 1
# cache.put(3, 3);    // evicts key 2
# cache.get(2);       // returns -1 (not found)
# cache.put(4, 4);    // evicts key 1
# cache.get(1);       // returns -1 (not found)
# cache.get(3);       // returns 3
# cache.get(4);       // returns 4
#

Node = Struct.new(:key, :value, :next, :prev)

class LRUCache
    attr_reader :map, :capacity, :size

=begin
    :type capacity: Integer
=end
    def initialize(capacity)
        @map = {}
        @head = nil
        @tail = nil
        @capacity = capacity
        @size = 0
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
        return -1 unless map[key]

        node = extract_node(map[key])
        add_node(node)

        node.value
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
        if map[key]
            node = extract_node(map[key])
            node.value = value
            add_node(node)
        else
            node = Node.new(key, value)
            add_node(node)
            if size > capacity
                map.delete(@head.key)
                extract_node(@head)
            end
            map[key] = node
        end
        value
    end

    private

    def add_node(node)
        node.prev = @tail
        node.next = nil
        if @tail == nil
            @head = node
            @tail = node
        else
            @tail.next = node
            @tail = node
        end
        @size += 1

        node
    end

    def extract_node(node)
        return nil if node == nil

        if @head == node
            @head = node.next
        else
            node.prev.next = node.next
        end

        if node.next == nil
            @tail = node.prev
        else
            node.next.prev = node.prev
        end

        @tail = nil if @head == nil
        node.next = nil
        node.prev = nil
        @size -= 1

        node
    end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
