class Solution {
    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        var h = head
        let dummy = ListNode(0)
        dummy.next = h

        while h != nil {
            guard let next = h?.next else { break }
            let gcd = getGCD(h?.val ?? 1, next.val ?? 1)
            let newNode = ListNode(gcd)
            h?.next = newNode
            newNode.next = next
            h = next
        }
        return dummy.next
    }
    func getGCD(_ n1: Int = 1, _ n2: Int = 1) -> Int {
        // Solution 2: Euclid's Algorithm
        var a = n1
        var b = n2

        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
        
        // Solution 1
        // var a = min(n1, n2)
        // var count = 1

        // while count <= a {
        //     if a % count != 0 {
        //         count += 1
        //         continue
        //     }
        //     let div = a / count
        //     if n1 % div == 0 && n2 % div == 0 {
        //         return div
        //     }
        //     count += 1
        // }
        // return 1
    }
}