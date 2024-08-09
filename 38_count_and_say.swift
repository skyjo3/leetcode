class Solution {
    func countAndSay(_ n: Int) -> String {
        // Solution 1
        // start from CAS(1), CAS(2), CAS(3)... CAS(n)
        var str = ""
        for i in 1...n {
            if i == 1 { str = "1"; continue }
            let arr = Array(str)
            var tempNum = arr[0]
            var count = 0
            var nextStr = ""
            for j in 0..<arr.count {
                if arr[j] == tempNum {
                    count += 1
                } else {
                    nextStr += String(count)
                    nextStr += String(tempNum)
                    count = 1
                    tempNum = arr[j]
                }
                if j == arr.count - 1 {
                    nextStr += String(count)
                    nextStr += String(tempNum)
                }
            }
            str = nextStr
        }
        return str
    }
}