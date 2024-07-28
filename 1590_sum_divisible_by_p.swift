class Solution {
    // Solution 3: Prefix Sum - O(n)/O(n)
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        var k = nums.reduce(0,+) % p
        if k == 0 { return 0 }
        var reminders : [Int:Int] = [0:-1]
        var res = nums.count
        var sum = 0

        for (index, num) in nums.enumerated() {
            sum += num
            let r = sum % p
            var rp = (r - k + p) % p
            if let rem = reminders[rp] { // it has a pair
                res = min(res, index - rem) // return the subarray lenth
            }
            reminders[r] = index
        }
        
        return res == nums.count ? -1 : res
    }

    // Solution 2: Brute Force - O(n^2), taking too long
    // func minSubarray(_ nums: [Int], _ p: Int) -> Int {
    //     if nums.reduce(0,+) % p == 0 { return 0 }
    //     var arr = nums
    //     var n = 1
    //     while n < arr.count {
    //         // select a range and check if the sum of subArr is divisible
    //         for i in 0...arr.count - n {
    //             // var subtractedArr = arr[i...i+n-1]
    //             var subArr1 = i-1>=0 ? arr[0...i-1] : []
    //             var subArr2 = i+n < arr.count ? arr[i+n...arr.count-1] : []
    //             var subArr = subArr1 + subArr2
    //             if subArr.reduce(0,+) % p == 0 { return n }
    //         }
    //         n += 1
    //     }
    //     return -1
    // }

    // Solution 1: DFS (Failed, because it needs to be subarray)
    // func minSubarray(_ nums: [Int], _ p: Int) -> Int {
    //     let res : Int = dfs(nums, 0, p) 
    //     return res == Int.max ? -1 : res
    // }
    // func dfs(_ subArr: [Int],_ n: Int, _ p: Int) -> Int {
    //     // base case
    //     if subArr.count == 0 { return Int.max }
    //     else if subArr.reduce(0,+) % p == 0 { return n }

    //     // enter branches
    //     var minVal = Int.max

    //     for i in 0..<subArr.count {
    //         if subArr[i] % p != 0 {
    //             var newArr = subArr
    //             newArr.remove(at: i)
    //             minVal = min(minVal, dfs(newArr, n+1, p))
    //         }
    //     }

    //     return minVal
    // }
}