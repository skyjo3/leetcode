class Solution {
    func nearestPalindromic(_ n: String) -> String {
        let num = Int(n) ?? 0
        switch n.length {
            case 1:
            return String(num - 1)

            case let x where x % 2 == 1:
            var numArr = strToNumArray(n)
            var res : [Int] = []
            for i in 0 ..< numArr.count/2 {
                numArr[numArr.count-1-i] = numArr[i]
            }
            var powerValue = pow(10.0, Double(n.length))
            res.append(Int(powerValue) + 1)

            res.append(oddNumArrayUp(&numArr))
            res.append(numArrayToInt(numArr))
            res.append(oddNumArrayDown(&numArr))
            
            powerValue = pow(10.0, Double(n.length-1))
            res.append(Int(powerValue) - 1)

            return String(findClosestRes(&res, num))
        
            case let y where y % 2 == 0:
            var numArr = strToNumArray(n)
            var res : [Int] = []
            for i in 0 ..< numArr.count/2 {
                numArr[numArr.count-1-i] = numArr[i]
            }
            var powerValue = pow(10.0, Double(n.length))
            res.append(Int(powerValue) + 1)

            res.append(evenNumArrayUp(&numArr))
            res.append(numArrayToInt(numArr))
            res.append(evenNumArrayDown(&numArr))
            
            powerValue = pow(10.0, Double(n.length-1))
            res.append(Int(powerValue) - 1)

            return String(findClosestRes(&res, num))
            
            default:
            return "0"
        }
        return "0"
    }
    func strToNumArray (_ str: String) -> [Int] {
        var array : [Character] = Array(str)
        var arr : [Int] = []
        for i in 0 ..< str.count {
            arr.append(Int(String(array[i])) ?? 0)
        }
        return arr
    }
    func numArrayToInt (_ numArr: [Int]) -> Int {
        return numArr.reduce(0) { $0 * 10 + $1 }
    }
    func oddNumArrayUp (_ numArr: inout [Int]) -> Int {
        if numArr[numArr.count/2] != 9 {
            var nArr = numArr
            nArr[numArr.count/2] += 1
            return numArrayToInt(nArr)
        }
        var nArr = numArr
        if numArr.count/2+1 < numArr.count {
            nArr[numArr.count/2+1] += 1 
        }
        nArr[numArr.count/2] = 0
        if numArr.count/2-1 >= 0 {
            nArr[numArr.count/2-1] += 1
        }
        return numArrayToInt(nArr)
    }
    func evenNumArrayUp (_ numArr: inout [Int]) -> Int {
        if numArr[numArr.count/2] != 9 {
            var nArr = numArr
            nArr[numArr.count/2] += 1
            nArr[numArr.count/2-1] += 1
            return numArrayToInt(nArr)
        }
        var nArr = numArr
        if numArr.count/2+1 < numArr.count {
            nArr[numArr.count/2+1] += 1 
        }
        nArr[numArr.count/2] = 0
        if numArr.count/2-1 >= 0 {
            nArr[numArr.count/2-1] = 0
        }
        if numArr.count/2-2 >= 0 {
            nArr[numArr.count/2-2] += 1
        }
        return numArrayToInt(nArr)
    }
    func oddNumArrayDown (_ numArr: inout [Int]) -> Int {
        if numArr[numArr.count/2] != 0 {
            var nArr = numArr
            nArr[numArr.count/2] -= 1
            return numArrayToInt(nArr)
        }
        var nArr = numArr
        if numArr.count/2+1 < numArr.count {
            nArr[numArr.count/2+1] -= 1 
        }
        nArr[numArr.count/2] = 9
        if numArr.count/2-1 >= 0 {
            nArr[numArr.count/2-1] -= 1
        }
        return numArrayToInt(nArr)
    }
    func evenNumArrayDown (_ numArr: inout [Int]) -> Int {
        if numArr[numArr.count/2] != 0 {
            var nArr = numArr
            nArr[numArr.count/2] -= 1
            nArr[numArr.count/2-1] -= 1
            return numArrayToInt(nArr)
        }
        var nArr = numArr
        if numArr.count/2+1 < numArr.count {
            nArr[numArr.count/2+1] -= 1 
        }
        nArr[numArr.count/2] = 9
        if numArr.count/2-1 >= 0 {
            nArr[numArr.count/2-1] = 9
        }
        if numArr.count/2-2 >= 0 {
            nArr[numArr.count/2-2] -= 1
        }
        return numArrayToInt(nArr)
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