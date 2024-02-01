class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        
        if nums.count == 1 {
            return [nums]
        }

        var temp = nums
        var res : [[Int]] = []

        for i in 0..<temp.count {
            if let n = temp.popLast() {
                var perms = permute(temp)
                for perm in perms {
                    var p = perm
                    p.insert(n, at:0)
                    res.append(p)
                }
                temp.insert(n, at:0)
            }
        }
        return res
    }
}