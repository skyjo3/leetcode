class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var res : [Int] = []

        for i in 0 ..< queries.count {
            let range = queries[i]
            var temp = 0
            for j in range[0]...range[1] {
                temp = temp ^ arr[j]
            }
            res.append(temp)
        }
        return res
    }
}