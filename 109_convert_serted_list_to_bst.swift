class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        // 1. turn linked list into array
        var h = head
        var arr : [Int] = []
        while h != nil {
            arr.append(h!.val)
            h = h!.next
        }
        // 2. turn array into balanced bst
        return buildBST(arr, 0, arr.count-1)
    }
    func buildBST(_ arr: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        if start > end { return nil }
        let mid = (start+end)/2
        let n = TreeNode(arr[mid])
        if mid-1 >= 0 {
            n.left = buildBST(arr, start, mid-1)
        }
        if mid+1 < arr.count {
            n.right = buildBST(arr, mid+1, end)
        }
        return n
    }
}