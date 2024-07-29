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
    func removeNthFromEnd(_ head: ListNode?, _ num: Int) -> ListNode? {
        guard let h = head else { return nil }
        var n = h
        var c = 1
        while n.next != nil {
            c += 1
            n = n.next!
        }
        let target = c - num + 1
        if target == 1 { return h.next }

        n = h
        var count = 1
        while n.next != nil {
            count += 1
            if count == target && count <= c-1 {
                n.next = n.next!.next!
                return h
            } else if count == target {
                n.next = nil
                return h
            }
            n = n.next!
        }
        return h
    }
}