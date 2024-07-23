class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let r = root else { return [] }
        var queue : [TreeNode] = [r]
        var res : [[Int]] = []
        while queue.count != 0 {
            var qLen = queue.count
            var arr : [Int] = []
            for i in 0..<qLen {
                var q = queue.removeFirst()
                arr.append(q.val)
                if let l = q.left { queue.append(l) }
                if let r = q.right { queue.append(r) }    
            }
            res.append(arr)
        }
        return res
    }
}