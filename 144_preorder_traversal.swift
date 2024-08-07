class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let n = root else { return [] }
        return [n.val] + preorderTraversal(n.left) + preorderTraversal(n.right)
    }
}