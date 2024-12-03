class Solution {
    func reverseBits(_ n: Int) -> Int {
        var sum = 0
        var num = n

        for i in 0...31 {
            let cur = num % 2
            num /= 2
            sum += (cur << (31-i))
        }
        return sum
    }
}