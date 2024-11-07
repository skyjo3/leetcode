class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        return dfs(root)
    }
    func dfs(_ root: TreeNode?) -> [Int] {
        guard let r = root else { return [] }

        var arr : [Int] = []
        arr += dfs(r.left)
        arr += dfs(r.right)
        arr.append(r.val)

        return arr
    }
}