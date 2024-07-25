class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }
        return dfs(r)   
    }
    func dfs(_ node: TreeNode?) -> Int {
        guard let n = node else { return 100001 }
        if n.left == nil && n.right == nil { return 1 }
        return min( dfs(n.left), dfs(n.right) ) + 1
    }
}