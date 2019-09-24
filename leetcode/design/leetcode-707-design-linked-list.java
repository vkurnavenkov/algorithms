// LeetCode 707. Design Linked List
// https://leetcode.com/problems/design-linked-list/
//
// Design your implementation of the linked list. You can choose to use the singly linked list or the doubly linked list. A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node. If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.
//
// Implement these functions in your linked list class:
//
// get(index) : Get the value of the index-th node in the linked list. If the index is invalid, return -1.
// addAtHead(val) : Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
// addAtTail(val) : Append a node of value val to the last element of the linked list.
// addAtIndex(index, val) : Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. If index is negative, the node will be inserted at the head of the list.
// deleteAtIndex(index) : Delete the index-th node in the linked list, if the index is valid.
// Example:
//
// MyLinkedList linkedList = new MyLinkedList();
// linkedList.addAtHead(1);
// linkedList.addAtTail(3);
// linkedList.addAtIndex(1, 2);  // linked list becomes 1->2->3
// linkedList.get(1);            // returns 2
// linkedList.deleteAtIndex(1);  // now the linked list is 1->3
// linkedList.get(1);            // returns 3
// Note:
//
// All values will be in the range of [1, 1000].
// The number of operations will be in the range of [1, 1000].
// Please do not use the built-in LinkedList library.
//

class ListNode {
    int val;
    ListNode next;
    public ListNode(int v) { val = v; }
}

class MyLinkedList {
    private ListNode head, tail;
    private int size;

    /** Initialize your data structure here. */
    public MyLinkedList() {
        head = null;
        tail = null;
        size = 0;
    }

    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    public int get(int index) {
        ListNode node = nodeByIndex(index);
        return node != null ? node.val : -1;
    }

    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    public void addAtHead(int val) {
        ListNode node = new ListNode(val);
        if (head == null) {
            head = node;
            tail = node;
        } else {
            node.next = head;
            head = node;
        }
        size++;
    }

    /** Append a node of value val to the last element of the linked list. */
    public void addAtTail(int val) {
        ListNode node = new ListNode(val);
        if (head == null) {
            head = node;
            tail = node;
        } else {
            tail.next = node;
            tail = node;
        }
        size++;
    }

    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    public void addAtIndex(int index, int val) {
        if (index <= 0) {
            addAtHead(val);
            return;
        }

        if (index == size) {
            addAtTail(val);
            return;
        }

        ListNode node = nodeByIndex(index - 1);
        if (node == null) return;

        ListNode newNode = new ListNode(val);
        newNode.next = node.next;
        node.next = newNode;
        size++;
    }

    /** Delete the index-th node in the linked list, if the index is valid. */
    public void deleteAtIndex(int index) {
        if (size == 0 || index < 0 || index >= size) return;

        if (index == 0) {
            head = head.next;
            if (head == null) tail = null;
            size--;
            return;
        }
        ListNode node = nodeByIndex(index - 1);
        if (node == null || node.next == null) return;

        node.next = node.next.next;
        if (node.next == null) tail = node;
        size--;
    }

    private ListNode nodeByIndex(int index) {
        if (size == 0 || index < 0 || index >= size) return null;

        ListNode node = head;
        while (node != null && index-- > 0) node = node.next;

        return node;
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * MyLinkedList obj = new MyLinkedList();
 * int param_1 = obj.get(index);
 * obj.addAtHead(val);
 * obj.addAtTail(val);
 * obj.addAtIndex(index,val);
 * obj.deleteAtIndex(index);
 */
