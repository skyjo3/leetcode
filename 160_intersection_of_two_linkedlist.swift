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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if let nodeA = headA, let nodeB = headB {
            if nodeA === nodeB {
                return nodeA
            } else {
                // compare the depth
                var depthA = getListDepth(nodeA)
                var depthB = getListDepth(nodeB)

                if depthA <= depthB {
                    let diff = depthB - depthA
                    print("diff: " + String(diff))
                    return findIntersection(nodeA, nodeB, diff)
                } else {
                    let diff = depthA - depthB
                    print("diff: " + String(diff))
                    return findIntersection(nodeB, nodeA, diff)
                }
            }
        } 
        return nil
    }

    func getListDepth(_ head: ListNode?) -> Int {
        if var currentNode = head {
            var count = 0
            while let nextNode = currentNode.next {
                count += 1
                currentNode = nextNode
            }
            return count
        }
        return 0
    }

    func findIntersection (_ nodeA: ListNode?, _ nodeB: ListNode?, _ diff: Int) -> ListNode? {
        if var nextA = nodeA, var nextB = nodeB {   
            if diff != 0 {
                for i in 1...diff {
                    if let hasNext = nextB.next {
                        nextB = hasNext
                    }
                }
                print("starting value: " + String(nextB.val))
            }
            while true {
                if nextA === nextB {
                    return nextA
                }
                if let nonLastB = nextB.next, let nonLastA = nextA.next {
                    nextB = nonLastB
                    nextA = nonLastA
                    continue
                } else {
                    break
                }
            }
        }
        return nil
    }
}