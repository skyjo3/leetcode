class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res : [[Int]] = []
        dfs(0, 0, [])

        func dfs(_ index: Int, _ total: Int, _ comb: [Int]) {
            
            // base case 1
            if comb.reduce(0,+) == target {
                res.append(comb)
                return
            }
            // base case 2
            if index >= candidates.count || total > target {
                return
            }

            // 1. having the current element
            dfs(index, total+candidates[index], comb+[candidates[index]])
            // 2. not having the current element
            dfs(index+1, total, comb)
        }
        return res
    }
}