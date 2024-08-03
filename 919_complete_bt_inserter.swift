class CBTInserter {

    var r : TreeNode?

    init(_ root: TreeNode?) {
        r = root
    }
    
    func insert(_ val: Int) -> Int {
        // BFS
        var queue : [TreeNode] = [r!]
        while queue.count != 0 {
            let q = queue.removeFirst()
            if let l = q.left {
                queue.append(l)
            } else {
                q.left = TreeNode(val)
                return q.val
            }
            if let r = q.right {
                queue.append(r)
            } else {
                q.right = TreeNode(val)
                return q.val
            }
        }
        return r!.val // dummy
    }
    
    func get_root() -> TreeNode? {
        return r
    }
}