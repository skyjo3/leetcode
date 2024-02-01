class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        // var array = nums
        // array.sort()
        // var temp = 0
        // for i in 0..<array.count {
        //     if array[i] == temp {
        //         return temp
        //     } else {
        //         temp = array[i]
        //     }
        // }
        // return temp
        
        if nums.count < 2 {
            return 0
        }

        var slow = nums[0]
        var fast = nums[nums[0]]

        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
            //print("slow: \(slow), fast: \(fast)")
        }
        //print("\n")
        fast = 0
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
            //print("slow: \(slow), fast: \(fast)")
        }
        return slow
    }
}