class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res : Set<[Int]> = []
        for i in 0..<nums.count-2 {
            let newN = Array(nums[i+1...nums.count-1])
            // print(i, newN)
            let r = twoSum(newN, -nums[i])
            for j in 0..<r.count {
                var c = [nums[i],r[j][0],r[j][1]]
                c.sort {$0 < $1}
                if !res.contains(c) {
                    res.insert(c)
                    // print(res)
                }
            }
        }
        return Array(res)
    }
    // Hash Map
    func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        // Solution 2: Hashmap - O(n)/O(n)
        var hash : [Int:Int] = [:]
        var res : [[Int]] = []
        for i in 0..<nums.count {
            if hash.keys.contains(nums[i]) {
                res.append([nums[i], hash[nums[i]]!])
            }
            hash[target - nums[i]] = nums[i]
        }
        return res
    }
}