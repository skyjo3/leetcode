class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        // Solution 2: Two Pointer - O(n^2) / O(n)
        var minVal = Int.max
        var res = 0
        var nums2 = nums
        nums2.sort { $0 < $1 }
        
        for i in 0..<nums2.count-2 {
            var p1 = i+1
            var p2 = nums.count-1
            while (p1 < p2) {
                let sum = nums2[i] + nums2[p1] + nums2[p2]
                if abs(sum-target) < minVal {
                    res = sum
                    minVal = abs(sum-target)
                }
                if sum > target {
                    p2 -= 1
                } else {
                    p1 += 1
                }
            }    
        }
        return res

        // Solution 1: Brute Force - O(n^3) / O(1)
        // var minVal = Int.max
        // var res : Int = 0
        // for i in 0..<nums.count {
        //     for j in i+1..<nums.count {
        //         for k in j+1..<nums.count {
        //             var sum = nums[i]+nums[j]+nums[k]
        //             if sum == target {
        //                 return target
        //             } else if abs(sum-target) < minVal {
        //                 minVal = abs(sum-target)
        //                 res = sum
        //             }
        //         }
        //     }
        // }
        // return res
    }
}