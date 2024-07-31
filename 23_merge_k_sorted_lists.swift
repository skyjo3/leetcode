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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }

        if l1.val < l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        // Solution 2: Merge by head
        guard !lists.isEmpty else { return nil }
        var mergedList = lists[0]
        for i in 1..<lists.count {
            mergedList = mergeTwoLists(mergedList, lists[i])
        }
        return mergedList

        // Solution 1: Brute Force (It works, but it is not efficient enough.)
        // guard !lists.isEmpty else { return nil }

        // var dummyHead : ListNode? = ListNode(-10001)
        // var n : ListNode? = lists[0]
        // dummyHead!.next = n

        // loop_lists: for i in 1..<lists.count {
        //     if n == nil {
        //         n = lists[i]
        //         dummyHead!.next = n
        //         continue loop_lists
        //     }
        //     var node = lists[i]
        //     loop_node: while node != nil {
        //         n = dummyHead!.next // restart
        //         printLists(n)
        //         if node!.val < n!.val {
        //             let temp = node!.next
        //             dummyHead!.next = node
        //             node!.next = n! 
        //             node = temp
        //             continue loop_node
        //         }
        //         loop_ans: while n != nil {
        //             // if smaller than the current node, insert.
        //             if let next = n!.next {
        //                 if n!.val <= node!.val && node!.val <= next.val {
        //                     let temp = n!.next
        //                     let out_temp = node!.next
        //                     n!.next = node
        //                     node!.next = temp
        //                     node = out_temp
        //                     continue loop_node
        //                 }
        //             } else if node!.val > n!.val {
        //                 n!.next = node
        //                 break loop_ans
        //             }
        //             n = n!.next
        //         }
        //         node = node!.next
        //     }
        // }
        // return dummyHead!.next
    }
    // func printLists (_ head: ListNode?) {
    //     guard var h = head else { return }
    //     while h != nil {
    //         print(h.val)
    //         if let next = h.next {
    //             h = next
    //         } else {
    //             print("===")
    //             break
    //         }
    //     }
    // }
}