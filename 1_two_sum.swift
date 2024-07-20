class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Solution 1: Brutal Force - O(n^2)
        // for i in 0..<nums.count {
        //     for j in i..<nums.count {
        //         if nums[i]+nums[j] == target {
        //             return [i, j]
        //         }
        //     }
        // }
        // return [0,0]
        
        // Solution 2: Hashmap
        var hash : [Int:Int] = [:]
        for i in 0..<nums.count {
            let diff = target - nums[i]
            if hash.keys.contains(nums[i]) {
                return [i, hash[nums[i]]!]
            }
            hash[diff] = i
        }
        return [0,0]
    }
}