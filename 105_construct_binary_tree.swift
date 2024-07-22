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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        // Solution 2: Second Try
        if preorder.count == 0 || inorder.count == 0 { return nil }
        var root = TreeNode(preorder[0])
        guard let mid = inorder.firstIndex(of: root.val) else { return nil }
        root.left = buildTree(Array(preorder[1...mid]), Array(inorder[...mid-1]))
        root.right = buildTree(Array(preorder[mid+1...]), Array(inorder[mid+1...]))
        return root

        // Solution 1: First Try
        // var root = TreeNode(preorder[0])
        // if preorder == inorder { return root }
        // for i in 0..<inorder.count {
        //     if inorder[i] == preorder[0] { 
        //         var r_inorder : [Int] = []
        //         var r_preorder : [Int] = []
        //         var l_inorder : [Int] = []
        //         var l_preorder : [Int] = []

        //         if i+1 < inorder.count {
        //             r_inorder = Array(inorder[i+1...inorder.count-1])
        //             r_preorder = Array(preorder[preorder.count-r_inorder.count...preorder.count-1])
        //             root.right = buildTree(r_preorder, r_inorder) 
        //         } 
        //         if 1 < preorder.count {
        //             l_inorder = Array(preorder[1...preorder.count-r_inorder.count-1])
        //             l_preorder = Array(inorder[0...i-1])
        //             root.left = buildTree(l_preorder, l_inorder) 
        //         }
        //     }
        // }
        // return root
    }
}
