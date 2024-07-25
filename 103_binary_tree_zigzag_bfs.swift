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
    // var res : [[Int]] = []
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        // Solution 1: DFS
        // runZig(root, 0)
        // return res
        
        // Sultion 2: BFS
        guard let r = root else { return [] }
        var res : [[Int]] = []
        var queue : [TreeNode] = [r]
        var level = 0
        while queue.count != 0 {
            var arr : [Int] = []
            for _ in 0..<queue.count {
                var q : TreeNode = queue.removeFirst()
                if level % 2 == 0 {
                    arr.append(q.val)
                } else {
                    arr.insert(q.val, at:0)
                }
                if let l = q.left { queue.append(l) }
                if let r = q.right { queue.append(r) }
            }
            res.append(arr)
            level += 1
        }
        return res
    }
    // func runZig(_ node: TreeNode?, _ level: Int) {
    //     guard let n = node else { return }
    //     if res.count <= level {
    //         res.append([])
    //     }
    //     if level % 2 == 1 {
    //         res[level].insert(n.val, at: 0)
    //         runZig(n.left, level+1)
    //         runZig(n.right, level+1)
    //     } else {
    //         res[level].append(n.val)
    //         runZig(n.left, level+1)
    //         runZig(n.right, level+1)
    //     }
    // }
}
