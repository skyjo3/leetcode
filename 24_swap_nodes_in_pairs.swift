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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let h = head else { return nil }
        let dummyHead = ListNode(0)
        var n : ListNode? = h
        var prev = dummyHead
        dummyHead.next = n
        while n != nil && n!.next != nil {
            var nxt : ListNode? = n!.next!.next
            var sec = n!.next
            
            prev.next = sec
            n!.next = nxt
            sec!.next = n
            
            prev = n!
            n = nxt
        }
        return dummyHead.next
    }
}