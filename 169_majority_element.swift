class Solution {
    func majorityElement(_ nums: [Int]) -> Int {

        if nums.count == 1 { return nums[0] }
        var nums = nums.sorted()
        
        if nums[nums.count/2-1] == nums[nums.count-1] {
            return nums[nums.count-1]
        } else if nums[0] == nums[nums.count/2+1] {
            return nums[0]
        } else {
            return nums[nums.count/2]
        }
    }
}