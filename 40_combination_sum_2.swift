class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        // Solution 1: Recursion
        var input = candidates
        input.sort { $0 <= $1 }
        return combination(&input, 0, [], target)
    }
    func combination(_ candidates: inout [Int], _ index: Int, _ members: [Int], _ target: Int) -> [[Int]] {
        if target == 0 { return [members] }
        if index >= candidates.count { return [] }

        var res : [[Int]] = []
        var m = members
        let num = candidates[index]
        
        // yes
        if num <= target {
            m.append(num)
            res += combination(&candidates, index+1, m, target-num)
        } 

        // no
        var i = index+1
        while i < candidates.count {
            if candidates[i] != num {
                res += combination(&candidates, i, members, target)
                break
            }
            i += 1
        }

        return res
    }
}