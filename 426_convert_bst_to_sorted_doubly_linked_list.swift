/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func treeToDoublyList(_ root: Node?) -> Node? {

        // RETURN Sorted Doubly Linked List

        // the predecessor of the first element is the last element
        // the predecessor and successor pointers in a doubly-linked list

        var array: [Int] = []
        var nodeList: [Node] = []
        
        // 1. Traverse the Tree, and save values to an array.
        if let head = root {
            traverseTree(root)
        }
        print(array)

        // 2. Sort the array, and save it to a linked list.
        array.sort()
        print(array)

        // return the pointer to the smallest element of the linked list.
        for i in array {
            let node = Node(i)
            nodeList.append(node)
            print(node.val)
        }
        for index in 0..<nodeList.count {
            let node = nodeList[index]
            let prevIndex = (index - 1 + nodeList.count) % nodeList.count
            let nextIndex = (index + 1) % nodeList.count
            node.left = nodeList[prevIndex]
            node.right = nodeList[nextIndex]
        }
        return nodeList.first

        func traverseTree(_ root: Node?) { 
            if let head = root {
                array.append(head.val)
                if let left = head.left {
                    traverseTree(left)
                }
                if let right = head.right {
                    traverseTree(right)
                }
            } 
        }
    }

    
}