/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    // func reverseList(_ head: ListNode?) -> ListNode? {
    //     // Solution 1: iterative loop
    //     var head = head
    //     var newHead: ListNode? = nil
    //     while head != nil {
    //         let next = head?.next
    //         head?.next = newHead
    //         newHead = head
    //         head = next
    //     }
    //     return newHead
    // }
    func reverseList(_ head: ListNode?) -> ListNode? {
        // Solution 2: recursion
        if let h = head {
            let (n, first) = returnNext(h)
            n!.next = nil
            return first
        }
        return head
    }
    func returnNext(_ prev: ListNode?) -> (ListNode?, ListNode?) { // return next/first
        if let node = prev {
            if let next = node.next {
                var (n, first) = returnNext(next)
                n!.next = node
                return (node, first)
            }
        }
        return (prev, prev)
    }
}