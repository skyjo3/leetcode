class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        return dfs(root)
    }

    func dfs(_ node: TreeNode?) -> Int {
        guard let n = node else { return 0 }
        return max(dfs(n.left), dfs(n.right))+1
    }
}
