class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ n1: TreeNode?, _ n2: TreeNode?) -> TreeNode? {
        guard let r = root, let p = n1, let q = n2 else { return nil }

        var queue1 : [TreeNode] = []
        var queue2 : [TreeNode] = []

        getLCA(r, p, &queue1)
        getLCA(r, q, &queue2)

        var i = 0
        while true {
            if i >= queue1.count || i >= queue2.count { return queue1[i-1] }
            if queue1[i].val != queue2[i].val { return queue1[i-1] }
            i += 1
        }
        return r
    }
    func getLCA (_ root: TreeNode?, _ n: TreeNode?, _ queue: inout [TreeNode]) {
        guard let r = root, let p = n else { return }
        var curNode = r
        while curNode.val != p.val {
            queue.append(curNode)
            if curNode.val > p.val {
                if let l = curNode.left { curNode = l }
            } else if curNode.val < p.val {
                if let r = curNode.right { curNode = r }
            }
        }
        queue.append(curNode)
    }
}
