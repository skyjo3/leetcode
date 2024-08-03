class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let n = root else { return 0 }
        var count = 1
        count += countNodes(n.left)
        count += countNodes(n.right)
        return count
    }
}