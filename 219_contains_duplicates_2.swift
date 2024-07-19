class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        let set1 = Set(nums)
        if set1.count == nums.count {
            return false
        }

        var set2 : Set<Int> 
        if k >= nums.count {
            return true
        }
        set2 = Set(nums)
        // print(nums)
        // print(set2)
        // print("--- original")        

        var i = 0
        while i < nums.count {
            let minIndex = min(nums.count-1, i+k)
            let subArr = nums[i...minIndex]
            let set2 = Set(subArr)
            // print(subArr)
            // print(set2)
            // print("-----")
            if set2.count != subArr.count {
                return true
            }
            i += 1
        }
        return false
    }
}