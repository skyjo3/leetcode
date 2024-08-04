class Solution {
    // Solution 2: DP
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        var dp : [Int] = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(dp[0], nums[1])
        for i in 2..<nums.count {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i])
        }
        return dp[nums.count-1]
    }
    // Solution 1: DFS
    // func rob(_ nums: [Int]) -> Int {
    //     var n = nums
    //     return dfs(&n, 0, 0, false)
    // }
    // func dfs(_ nums: inout [Int], _ index: Int, _ curGain: Int, _ hasRobbed: Bool) -> Int {
    //     if index >= nums.count { return curGain }

    //     let val2 = dfs(&nums, index+2, curGain + nums[index], true)
    //     if !hasRobbed { return val2 }
    //     let val1 = dfs(&nums, index+1, curGain, false)
    
    //     return max(val1, val2)
    // }
}