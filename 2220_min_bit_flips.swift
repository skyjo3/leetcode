class Solution {
    func minBitFlips(_ start: Int, _ goal: Int) -> Int {
        var b1 = getBinaryArrFromInt(start)
        var b2 = getBinaryArrFromInt(goal)
        
        var maxVal = max(b1.count, b2.count)
        var count = 0

        for i in 0 ..< maxVal {
            if i < b1.count && i < b2.count && b1[i] != b2[i] {
                count += 1
            } else if i < b1.count && i >= b2.count && b1[i] == 1 {
                count += 1
            } else if i < b2.count && i >= b1.count && b2[i] == 1 {
                count += 1
            }
        }
        return count
    }
    func getBinaryArrFromInt(_ num: Int) -> [Int] {
        if num == 0 { return [0] }

        var arr : [Int] = []
        var num = num
        var count = 1
        // get largest 2
        while true {
            if num - count >= 0 {
                count *= 2
            } else {
                break
            }
        }
        count /= 2
        
        // get each 0 / 1
        while true {
            if num - count >= 0 {
                arr.append(1)
                num -= count
            } else {
                arr.append(0)
            }
            if count == 1 {
                break
            }
            count /= 2
        }
        
        return arr.reversed()
    }
}