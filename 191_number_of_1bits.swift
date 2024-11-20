class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var str = String(n, radix: 2)
        var count = 0
        print(str)
        for i in str {
            if i == "1" {
                count += 1
            }
        }
        return count
    }
}