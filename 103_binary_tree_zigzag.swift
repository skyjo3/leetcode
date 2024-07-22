class Solution {
    var res : [[Int]] = []
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        runZig(root, 0)
        return res
    }
    func runZig(_ node: TreeNode?, _ level: Int) {
        guard let n = node else { return }
        if res.count <= level {
            res.append([])
        }
        if level % 2 == 1 {
            res[level].insert(n.val, at: 0)
            runZig(n.left, level+1)
            runZig(n.right, level+1)
        } else {
            res[level].append(n.val)
            runZig(n.left, level+1)
            runZig(n.right, level+1)
        }
    }
}
