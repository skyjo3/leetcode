class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        let r_mid = Int(ceil(Double(n)/2.0))
        let c_mid = n%2 == 0 ? r_mid : r_mid-1
        
        for i in 0 ..< r_mid {
            for j in 0 ..< c_mid {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[n-1-j][i]
                matrix[n-1-j][i] = matrix[n-1-i][n-1-j]
                matrix[n-1-i][n-1-j] = matrix[j][n-1-i]
                matrix[j][n-1-i] = temp
            }
        }
    }
}