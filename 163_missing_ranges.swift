class Solution {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
        guard nums.count > 0 else { return [[lower, upper]]}
        
        var arr : [[Int]] = []
        var first : Int?
        var start = lower

        for num in nums {
            if start < num {
                if first == nil {
                    first = start
                    start += 1
                }
            } else if start == num {
                start += 1
            }
            if let f = first {
                arr.append([f, num-1])
                first = nil
                start = num+1
            }
        }
        if nums[nums.count-1] < upper {
            arr.append([nums[nums.count-1]+1, upper])
        }
        return arr
    }
}