Node = Struct.new(:value, :next)

class LinkedList
  def initialize
    @head = nil
  end

  def reverse!
    cur = @head

    @head = nil
    while cur != nil
      node = cur
      next_node = cur.next
      node.next = @head
      @head = node

      cur = next_node
    end

    @head
  end

  def push(value)
    node = Node.new(value)
    unless @head
      @head = node
    else
      last.next = node
    end
    node.next = nil
  end

  def last
    return nil unless @head
    last = @head
    while last.next != nil
      last = last.next
    end
    last
  end

  def print
    cur = @head
    while cur != nil
      puts cur.value
      cur = cur.next
    end
  end
end

# Leetcode solutions
def reverse_list_recur(head)
    return head if head.nil? || head.next.nil?
    node = reverse_list(head.next)
    head.next.next = head
    head.next = nil
    node
end

def reverse_list(head)
    return head if head.nil?
    cur = head.next
    head.next = nil
    while cur
        node = cur
        cur = cur.next
        node.next = head
        head = node
    end
    head
end

list = LinkedList.new

[12, 5, 4, 7, 34, 8].each { |v| list.push(v) }

puts 'Original List:'
list.print

puts 'Reversed List:'
list.reverse!
list.print
