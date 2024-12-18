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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard var h : ListNode? = head else { return nil }
        var res : ListNode? = h
        var prev : ListNode? = ListNode()

        while h != nil {
            if h?.val == val {
                prev?.next = h?.next
                if res === h {
                    res = h?.next
                }
                h = h?.next
                continue    
            }
            prev = h
            h = h?.next
        }
        return res
    }
}