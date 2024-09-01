class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        if m*n != original.count { return [] }
        var res : [[Int]] = []
        for i in 0 ..< m {
            res.append(Array(original[i*n...(i+1)*n-1]))
        }
        return res
    }
}