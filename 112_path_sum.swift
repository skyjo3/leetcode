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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        return getSum(root, 0, targetSum)
    }
    func getSum(_ node: TreeNode?, _ currentSum: Int, _ targetSum: Int) -> Bool {
        guard let n = node else { return false }
        if n.left == nil && n.right == nil {  
            if currentSum + n.val == targetSum {
                return true
            } else {
                return false
            }
        }
        return getSum(n.left, currentSum+n.val, targetSum) || getSum(n.right, currentSum+n.val, targetSum)
    }
}