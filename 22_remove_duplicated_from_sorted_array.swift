class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        // Solution 1: Iteration
        // var temp = -101
        // var count = 0
        // var index = 0
        // while index < nums.count {
        //     if nums[index] == temp {
        //         nums.remove(at: index)
        //         continue
        //     }
        //     temp = nums[index]
        //     count += 1
        //     index += 1
        // }
        // return count

        // Solution 2: Two Pointer
        var index_dup = -1
        var index_find = 0
        var count = 0
        var temp = -101
        while index_find < nums.count {
            if nums[index_find] != temp {
                if index_dup != -1 {
                    nums[index_dup] = nums[index_find]
                    index_dup += 1
                }
                count += 1
                temp = nums[index_find]
            } else {
                if index_dup == -1 {
                    index_dup = index_find
                }
            }
            index_find += 1
        }
        return count
    }
}