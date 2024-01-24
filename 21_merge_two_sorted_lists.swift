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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        let defaultNode = ListNode(-101)

        var firstNode: ListNode = list1 ?? defaultNode
        var secondNode: ListNode = list2 ?? defaultNode

        var newListNode = ListNode()

        if firstNode.val == -101 && secondNode.val == -101 {
            return nil
        } else if firstNode.val == -101 {
            newListNode.val = secondNode.val
            if let secondNodeNext = secondNode.next {
                newListNode.next = self.mergeTwoLists(firstNode, secondNodeNext)
            }

        } else if secondNode.val == -101 {
            newListNode.val = firstNode.val
            if let firstNodeNext = firstNode.next {
                newListNode.next = self.mergeTwoLists(firstNodeNext, secondNode)
            }
            
        } else { // list1 and list2 both exist
            
            if firstNode.val <= secondNode.val {
                newListNode.val = firstNode.val
                if let firstNodeNext = firstNode.next {
                    newListNode.next = self.mergeTwoLists(firstNodeNext, secondNode)
                } else {
                    newListNode.next = self.mergeTwoLists(nil, secondNode)
                }
                
            } else if firstNode.val > secondNode.val {
                newListNode.val = secondNode.val
                if let secondNodeNext = secondNode.next {
                    newListNode.next = self.mergeTwoLists(firstNode, secondNodeNext)
                } else {
                    newListNode.next = self.mergeTwoLists(firstNode, nil)
                }
            }
        }

        return newListNode
    }

}