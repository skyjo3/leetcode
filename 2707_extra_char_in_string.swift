class Solution {
    func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
        var memo = [String:Int]()
        return dfs(s, dictionary, &memo)
    }
    func dfs(_ s: String, _ dictionary: [String], _ memo: inout [String:Int]) -> Int {
        if s.count == 0 {
            return 0
        }
        if let cachedResult = memo[s] {
            return cachedResult
        }
        var minV = s.count
        for word in dictionary {
            if let range = s.range(of: word) {
                var str = s
                str.removeSubrange(range)
                print(word, str)
                let num = dfs(str, dictionary, &memo)
                minV = min(minV, num)
            }
        }
        memo[s] = minV
        return minV
    }
}