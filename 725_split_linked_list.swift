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
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var count = 0
        var h : ListNode? = head
        while h != nil {
            count += 1
            h = h?.next
        }
        var num = Int(ceil(Double(count)/Double(k)))
        var remainder = count % k
        var arr : [ListNode?] = []
        h = head
        var next : ListNode?
        for i in 0 ..< k {
            arr.append(h)
            if remainder != 0 && arr.count == remainder + 1 {
                num -= 1
            }
            for n in 0 ..< num {
                next = h?.next
                if n == num - 1 {
                    h?.next = nil
                }
                h = next
            }
        }
        return arr
    }
}