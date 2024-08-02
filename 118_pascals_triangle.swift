class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var resArr : [[Int]] = []
        for i in 1...numRows {
            var tempArr : [Int] = []
            for j in 0..<i {
                if j == 0 || j == i-1 {
                    tempArr.append(1)
                } else {
                    tempArr.append(resArr[i-2][j-1]+resArr[i-2][j])
                }
            }
            resArr.append(tempArr)
        }
        return resArr
    }
}