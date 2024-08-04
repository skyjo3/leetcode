class Solution {
    func rangeSum(_ nums: [Int], _ n: Int, _ left: Int, _ right: Int) -> Int {
        // Solution 2: Priority Queue

        
        // Solution 1: Brute Force
        let mod = Int(pow(10.0, 9.0)) + 7
        var arrSum : [Int] = []
        for i in 0..<n {
            var sum = 0
            for j in i..<n {
                sum = (sum + nums[j]) % mod
                arrSum.append(sum)
            }
        }
        arrSum.sort { $0 < $1 }
        
        var sum = 0
        for i in left-1...right-1 {
            sum = (sum + arrSum[i]) % mod
        }
        return sum
    }
}