/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let head = head else {
            return false
        }

        var slowPointer: ListNode? = head
        var fastPointer: ListNode? = head

        while let next = fastPointer?.next {
            slowPointer = slowPointer?.next
            fastPointer = next.next

            if areNodesEqual(slowPointer, fastPointer) {
                return true
            }
        }

        return false
    }

    func areNodesEqual(_ node1: ListNode?, _ node2: ListNode?) -> Bool {
        return node1?.val == node2?.val && node1?.next === node2?.next
    }
}