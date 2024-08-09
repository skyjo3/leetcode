class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        // Solution 1: Two Pointer
        var l = 0
        var r = nums.count - 1
        var n = nums
        while l <= r {
            let mid = (l + r) / 2
            if nums[mid] == target {
                // check first and last
                return checkRange(&n, target, l, r)
            } else if nums[mid] < target {
                l = mid + 1
            } else { // nums[mid] > target
                r = mid - 1
            }
        } 
        return [-1, -1]
    }
    func checkRange(_ nums: inout [Int], _ target: Int, _ min: Int, _ max: Int) -> [Int] {
        var i = min
        var start : Int = -1
        var end : Int = -1
        while i <= max {
            if nums[i] == target {
                if start == -1 {
                    start = i
                }
                end = i
            }
            i += 1
        }
        return [start, end]
    }
}