ListNode = Struct.new(:val, :next)

# Builds new nodes for result list
def merge_two_lists_copy(l1, l2)
    l1_cur = l1
    l2_cur = l2
    head = nil
    tail = nil
    while l1_cur || l2_cur
        max_value, _ =
            if l1_cur && l2_cur
                if l1_cur.val < l2_cur.val
                    val, l1_cur = l1_cur.val, l1_cur.next
                else
                    val, l2_cur = l2_cur.val, l2_cur.next
                end
            elsif l1_cur
                val, l1_cur = l1_cur.val, l1_cur.next
            else
                val, l2_cur = l2_cur.val, l2_cur.next
            end
        new_node = ListNode.new(max_value)
        if head
            tail.next = new_node
            tail = tail.next
        else
            head = new_node
            tail = head
        end
    end
    head
end

# Keeps nodes, changes references
def merge_two_lists(l1, l2)
    head = nil
    tail = nil
    while l1 && l2
        if l1.val < l2.val
            node = l1
            l1 = l1.next
        else
            node = l2
            l2 = l2.next
        end
        if head
            tail.next = node
            tail = tail.next
        else
            head = node
            tail = head
        end
    end

    node = l1 || l2
    if head
        tail.next = node
    else
        head = node
    end

    head
end
