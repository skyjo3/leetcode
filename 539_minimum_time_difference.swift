class Solution {
    func findMinDifference(_ timePoints: [String]) -> Int {
        let offset = 24 * 60
        var set1 : Set<String> = []
        var arr : [Int] = []
        var minVal = Int.max

        for i in 0 ..< timePoints.count {
            if set1.contains(timePoints[i]) {
                return 0
            } else {
                set1.insert(timePoints[i])
            }
            var strArr = Array(timePoints[i])
            var hr = Int(String(strArr[0]))!*10 + Int(String(strArr[1]))!
            var m = Int(String(strArr[3]))!*10 + Int(String(strArr[4]))!
            m += hr * 60
            
            arr.append(m)
            arr.sort { $0 < $1 }

            for j in 0 ..< arr.count {
                if arr[j] == m {
                    if j-1 >= 0 {
                        minVal = min(minVal, arr[j] - arr[j-1])
                    } else { // first one
                        minVal = min(minVal, offset - arr[arr.count-1] + m)
                    }
                    if j+1 < arr.count {
                        minVal = min(minVal, arr[j+1] - arr[j])
                    } else { // last one
                        minVal = min(minVal, offset - m + arr[0])
                    }
                    break
                }
            }
        }
        return minVal
    }
}