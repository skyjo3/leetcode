class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let n = root else { return TreeNode(val) }
        if val < n.val {
            n.left = insertIntoBST(n.left, val)
        } else {
            n.right = insertIntoBST(n.right, val)
        }
        return n
    }
}