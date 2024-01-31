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
    var leftArray: [Int] = []
    var rightArray: [Int] = []

    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }

        checkLeftTree(root.left)
        checkRightTree(root.right)

        if leftArray.count != rightArray.count {
            return false
        }

        for i in 0..<leftArray.count {
            if leftArray[i] != rightArray[i] {
                return false
            }
        }
        return true
    }
    private func checkLeftTree(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        leftArray.append(root.val)

        if let left = root.left {
            checkLeftTree(left)
        } else {
            leftArray.append(101)
        }
        if let right = root.right {
            checkLeftTree(right)
        } else {
            leftArray.append(101)
        }
    }
    private func checkRightTree(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        rightArray.append(root.val)

        if let right = root.right {
            checkRightTree(right)
        } else {
            rightArray.append(101)
        }
        if let left = root.left {
            checkRightTree(left)
        } else {
            rightArray.append(101)
        }
    }
}