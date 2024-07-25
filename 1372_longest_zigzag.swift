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
    func longestZigZag(_ root: TreeNode?) -> Int {
        if let n = root {
            return countPath(n, 0, false)
        }
        return 0
    }

    func countPath(_ node: TreeNode?, _ count: Int, _ isPrevLeft: Bool) -> Int {
        var res = count 
        if let n = node {
            var hasLeft = false
            var hasRight = false
            var lCount = 0
            var rCount = 0

            if let l = n.left {
                hasLeft = true
                if count == 0 || isPrevLeft {
                    lCount = countPath(l, 1, true)
                } else {
                    lCount = countPath(l, count+1, true)
                }
            }
            if let r = n.right {
                hasRight = true
                if count == 0 || !isPrevLeft {
                    rCount = countPath(r, 1, false)
                } else {
                    rCount = countPath(r, count+1, false)
                }
            }
            if !hasLeft && !hasRight {
                return res
            }
            return max(res, lCount, rCount)
        }
        return res
    }
}