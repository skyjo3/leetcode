class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // Solution 1: Two Pointer
        var l = 0
        var r = nums.count-1
        while l <= r {
            var mid = (l+r)/2
            if target == nums[mid] {
                return mid
            }
            if nums[l] <= nums[mid] { // in the left sorted portion
                if target > nums[mid] || target < nums[l] {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            } else { // in the right sorted portion
                if target < nums[mid] || target > nums[r] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
        }
        return -1
    }
}