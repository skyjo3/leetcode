class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var n = nums
        n.sort()
        for i in 0..<nums.count-1 {
            if n[i] == n[i+1] {
                return true
            }
        }
        return false
    }
}