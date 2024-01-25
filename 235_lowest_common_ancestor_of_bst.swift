/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            print("some node is missing\n")
            return TreeNode(-1)
        }

        print("LCA: \(root.val), \(p.val), \(q.val)")

        if (isParentOfChild(root, p) && isParentOfChild(root, q)) {
            if let left = root.left {
                if (isParentOfChild(left,p) && isParentOfChild(left, q)) {
                    print("start finding the LCA of root.left\n")
                    return lowestCommonAncestor(left, p, q)
                } else {
                    print("\(root.val): not child of root.left")
                }
            }
            if let right = root.right {
                if (isParentOfChild(right,p) && isParentOfChild(right, q)) {
                    print("start finding the LCA of root.right\n")
                    return lowestCommonAncestor(right, p, q)
                } else {
                    print("\(root.val): not child of root.right")
                }
            } 
        }
        print("\(p.val) and \(q.val) is not the children of \(root.val)\n")
        return root

    }
    private func isParentOfChild(_ parent: TreeNode?, _ child: TreeNode?) -> Bool {
        guard let parent = parent, let child = child else {
            print("no parent or child\n")
            return false
        }

        if parent.val == child.val {
            return true
        }

        var isLeftParentOfChild = false
        var isRightParentOfChild = false

        print("isParentOfChild: \(parent.val), \(child.val)")

        // check if parent's left and right is child.
        if let left = parent.left {
            if left.val == child.val {
                print("isParentOfChild: left \(left.val), \(child.val)\n")
                return true
            } 
        } 
        if let right = parent.right {
            if right.val == child.val {
                print("isParentOfChild: right \(right.val), \(child.val)\n")
                return true
            }
        } 

        // check if parent.left has child?
        if let left = parent.left {
            isLeftParentOfChild = isParentOfChild(left, child) 
            print("is left parent of child? \(isLeftParentOfChild)")
            if isLeftParentOfChild {
                print("\n")
                return true
            }
        }
        if let right = parent.right {
            isRightParentOfChild = isParentOfChild(right, child) 
            print("is right parent of child? \(isRightParentOfChild)")
            if isRightParentOfChild {
                print("\n")
                return true
            }
        }

        print("isParentOfChild: not parent of child? \(isLeftParentOfChild || isRightParentOfChild)\n")
        return isLeftParentOfChild || isRightParentOfChild
    }
}