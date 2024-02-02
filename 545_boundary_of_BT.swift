/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {

    var leftBoundary:[Int] = []
    var rightBoundary:[Int] = []
    var leaves:[Int] = []

    func boundaryOfBinaryTree(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return [0]
        }
        if let left = root.left {
            findLeftMost(left)
        }
        if let right = root.right {
            findRightMost(right) // need to be reversed
            rightBoundary.reverse()
        }        
        
        if root.left != nil || root.right != nil {
            findLeaves(root)
        }
        
        print("root: \(root.val)")
        print("leftB: \(leftBoundary)")
        print("leaves: \(leaves)")
        print("rightB: \(rightBoundary)")

        return [root.val] + leftBoundary + leaves + rightBoundary
    }

    func findLeftMost(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        leftBoundary.append(node.val)
        if let left = node.left {
            findLeftMost(left)
        } else if let right = node.right {
            findLeftMost(right)
        } else {
            leftBoundary.popLast()
        }
    }

    func findRightMost(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        rightBoundary.append(node.val)
        if let right = node.right {
            findRightMost(right)
        } else if let left = node.left {
            findRightMost(left)
        } else {
            rightBoundary.popLast()
        }
    }

    func findLeaves(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        if let left = node.left {
            findLeaves(left)
        } 
        if let right = node.right {
            findLeaves(right)
        }
        if node.left == nil && node.right == nil {
            leaves.append(node.val)
        }
    }
}