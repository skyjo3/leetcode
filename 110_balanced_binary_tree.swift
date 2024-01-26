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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }

        print("\ncheck if \(root.val) is balanced")

        var leftCount = 0
        var rightCount = 0
        var isLeftBalanced = true
        var isRightBalanced = true

        if let left = root.left {
            leftCount = 1 + getNumberOfChild(left)
        }
        
        if let right = root.right {
            rightCount = 1 + getNumberOfChild(right)
        }

        print("isBalanced of \(root.val) ? - leftCount: \(leftCount); rightCount: \(rightCount)")

        if abs(leftCount-rightCount) <= 1 {
            if let left = root.left {
                isLeftBalanced = isBalanced(left)
            }
            if let right = root.right {
                isRightBalanced = isBalanced(right)
            }
            print("isBalanced of \(root.val) ? - left: \(isLeftBalanced); right: \(isRightBalanced)")
            return isLeftBalanced && isRightBalanced
        } else {
            return false
        }
    }
    private func getNumberOfChild (_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        print("\ncheck number of child of \(root.val)")

        var leftCount = 0
        var rightCount = 0

        if root.left != nil {
            leftCount += 1
        }
        if root.right != nil {
            rightCount += 1
        }
        if root.left == nil && root.right == nil {
            print("no children")
            return 0
        }
        if let left = root.left {
            leftCount += getNumberOfChild(left)
        }
        if let right = root.right {
            rightCount += getNumberOfChild(right)
        }

        print("getNumberOfChild of \(root.val) - leftCount: \(leftCount); rightCount: \(rightCount)")
        if leftCount >= rightCount {
            return leftCount
        } else {
            return rightCount
        }
    }
}