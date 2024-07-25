class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head else { return nil }
        var start : ListNode? = head
        var prev : ListNode? = ListNode(0)
        var cur : ListNode? = start
        var next : ListNode? = ListNode(0)
        var set1 : Set<Int> = []
        while cur != nil {
            if !set1.contains(cur!.val) {
                set1.insert(cur!.val)
                prev = cur
                cur = cur!.next ?? nil
            } else {
                next = cur!.next ?? nil
                cur = next
                prev!.next = next
            }
            //print(start!.val, prev!.val, cur!.val, next!.val)
        }
        return start
    }
}
