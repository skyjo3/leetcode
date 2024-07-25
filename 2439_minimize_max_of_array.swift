class Solution {
    func minimizeArrayValue(_ nums: [Int]) -> Int {
        
        var maxVal = nums[0]
        var curSum = nums[0]
        
        // loop thru
        for i in 1..<nums.count {
            curSum += nums[i]
            let avg = Int(ceil(Double(curSum) / Double(i+1)))
            maxVal = max(maxVal, avg)
        }

        return maxVal
    }
}