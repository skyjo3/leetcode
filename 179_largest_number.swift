class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var arr = nums.map { String($0) }
        arr.sort { 
            let s1 = $0 + $1
            let s2 = $1 + $0
            return s1 > s2
        }
        var res = arr.joined()
        return Int(res) == 0 ? "0" : res
    }
}