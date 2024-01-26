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
    func isValidBST(_ root: TreeNode?) -> Bool {
        // whether the root exists or not
        guard let root = root else {
            return true
        }
        return isValidBSTWithMinMax(root, Int.min, Int.max)
    }

    private func isValidBSTWithMinMax(_ root: TreeNode?, _ minValue: Int, _ maxValue: Int) -> Bool {
        // whether the root exists or not
        guard let root = root else {
            return true
        }

        var isLeftBST = true
        var isRightBST = true
        
        // if there's a left node of the root, judge if its value is less than the root
        if let left = root.left {
            if left.val < root.val {
                if left.val > minValue {
                    isLeftBST = isValidBSTWithMinMax(left, minValue, root.val)
                } else {
                    isLeftBST = false
                }
            } else {
                return false
            }
        } 
        
        // if there's a left node of the root, judge if its value is less than the root
        if let right = root.right {
            if right.val > root.val {
                if right.val < maxValue {
                    isRightBST = isValidBSTWithMinMax(right, root.val, maxValue)
                } else {
                    isRightBST = false
                }
            } else {
                return false
            }
        } 
        return isLeftBST && isRightBST
    }
}