class Solution {
    func isHappy(_ n: Int) -> Bool {
        var s1 : Set<Int> = []
        var num = n
        while !s1.contains(num) {
            s1.insert(num)

            var sum = 0
            var i = 0
            
            repeat {
                i = num % 10
                sum += i*i
                num /= 10
            } while num > 0
            
            if sum == 1 {
                return true
            }

            num = sum
        }
        return false
    }
}