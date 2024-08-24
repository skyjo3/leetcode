class Solution {
    func nearestPalindromic(_ n: String) -> String {
        let num = Int(n) ?? 0
        switch n.length {
            case 1:
            return String(num - 1)

            case let x where x % 2 == 1:
            var numArr = n.compactMap { $0.wholeNumberValue }
            var res : [Int] = []
            for i in 0 ..< numArr.count/2 {
                numArr[numArr.count-1-i] = numArr[i]
            }
            var powerValue = pow(10.0, Double(n.length))
            res.append(Int(powerValue) + 1)
            if numArr[numArr.count/2] != 9 {
                var nArr = numArr
                nArr[numArr.count/2] += 1
                let high = numArrayToInt(nArr)
                res.append(high)
            }
            let mid = numArrayToInt(numArr)
            res.append(mid)
            if numArr[numArr.count/2] != 0 {
                numArr[numArr.count/2] -= 1
                let low = numArrayToInt(numArr)
                res.append(low)
            }
            powerValue = pow(10.0, Double(n.length-1))
            res.append(Int(powerValue) - 1)

            return String(findClosestRes(&res, num))
        
            case let y where y % 2 == 0:
            var numArr = n.compactMap { $0.wholeNumberValue }
            var res : [Int] = []
            for i in 0 ..< numArr.count/2 {
                numArr[numArr.count-1-i] = numArr[i]
            }
            var powerValue = pow(10.0, Double(n.length))
            res.append(Int(powerValue) + 1)
            if numArr[numArr.count/2] != 9 {
                var nArr = numArr
                nArr[numArr.count/2] += 1
                nArr[numArr.count/2-1] += 1
                let high = numArrayToInt(nArr)
                res.append(high)
            }
            let mid = numArrayToInt(numArr)
            res.append(mid)
            if numArr[numArr.count/2] != 0 {
                numArr[numArr.count/2] -= 1
                numArr[numArr.count/2-1] -= 1
                let low = numArrayToInt(numArr)
                res.append(low)
            }
            powerValue = pow(10.0, Double(n.length-1))
            res.append(Int(powerValue) - 1)

            return String(findClosestRes(&res, num))
            
            default:
            return "0"
        }
        return "0"
    }
    func numArrayToInt (_ numArr: [Int]) -> Int {
        return numArr.reduce(0) { $0 * 10 + $1 }
    }
    func findClosestRes (_ res: inout [Int], _ target: Int) -> Int {
        var absR = abs(res[0]-target)
        var r = res[0]
        for i in 1 ..< res.count {
            if abs(res[i]-target) <= absR && target != res[i] {
                r = res[i]
                absR = abs(res[i]-target)
            }
        }
        return r
    }
}