class Solution {
    func getFinalState(_ nums: [Int], _ k: Int, _ multiplier: Int) -> [Int] {
        var minIndex : Int
        var n = nums
        var queue : [Int] = []
        for j in 0 ..< k {
            minIndex = 0
            // find min
            for i in 0 ..< n.count {
                if n[i] < n[minIndex] {
                    minIndex = i
                }
            }
            // multiply
            n[minIndex] *= multiplier
        }
        return n
    }
}