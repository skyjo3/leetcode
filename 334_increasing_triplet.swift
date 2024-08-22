class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var res : [[Int]] = [[nums[0]]]
        var min1 = nums[0]
        var min2 : Int = Int.max
        var mid : Int = Int.max

        for i in 1 ..< nums.count {
            if nums[i] > mid {
                return true
            }
            if nums[i] < mid && nums[i] > min1 {
                mid = nums[i]
            } else if nums[i] > min2 && nums[i] < mid {
                min1 = min2
                mid = nums[i]
                min2 = Int.max
            } else if nums[i] < min1 {
                min2 = nums[i]
            } 
        }
        return false
    }
}