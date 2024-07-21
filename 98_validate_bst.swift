class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let r = root else { return true }
        return dfs(root, Int.min, Int.max)
    }

    private func dfs(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        guard let n = node else { return true }
        if n.val <= min || n.val >= max { return false } 
        return dfs(n.left, min, n.val) && dfs(n.right, n.val, max)
    }
}
