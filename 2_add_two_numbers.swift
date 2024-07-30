class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        var n : ListNode = ListNode(0)
        var dummyHead = ListNode(-1)
        var plus = 0

        dummyHead = n
            
        while node1 != nil || node2 != nil || plus == 1 {
            // -- do the addition, save the node value, and pass 1 to the next calculation if there's one
            let node : ListNode
            (node, plus) = addition(node1, node2, plus)
            n.next = node
            n = n.next!
            if let n1 = node1 { node1 = n1.next }
            if let n2 = node2 { node2 = n2.next }
        }
        return dummyHead.next
    }

    func addition(_ l1: ListNode?, _ l2: ListNode?, _ plus: Int) -> (ListNode, Int) {
        var a = l1 != nil ? l1!.val : 0
        var b = l2 != nil ? l2!.val : 0
        var n = ListNode((a+b+plus)%10)
        return (n, (a+b+plus)/10)
    }
}