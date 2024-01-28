class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        
        var dp = [Int](repeating: 0, count: gas.count)
        var sum = 0

        for i in 0..<gas.count {
            sum += (gas[i] - cost[i])
            dp[i] = sum
        }

        if sum < 0 {
            return -1
        }
        
        var index = 0
        var min = Int.max

        for i in 0..<gas.count {
            if dp[i] < min {
                min = dp[i]
                index = i
            }
        }
        return (index+1) % gas.count
    }
}