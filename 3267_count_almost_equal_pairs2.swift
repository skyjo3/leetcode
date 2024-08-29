class Solution {
    func countPairs(_ nums: [Int]) -> Int {
        var count = 0
        for i in 0 ..< nums.count {
            for j in i+1 ..< nums.count {
                if nums[i] == nums[j] || isAlmostEqual(nums[i], nums[j]) {
                    count += 1
                } 
            }
        }
        return count
    }
    
    func isAlmostEqual(_ x: Int, _ y: Int) -> Bool {
        var a1 = Array(String(x))
        var a2 = Array(String(y))
        
        // check if all char is contained
        let length = a1.count > a2.count ? a1.count : a2.count
        
        while a1.count < length {
            a1.insert("0", at: 0)
        }
        while a2.count < length {
            a2.insert("0", at: 0)
        }
        
        return checkSwappedValues(a1, x, y) || checkSwappedValues(a2, y, x)
    }
    
    func checkSwappedValues(_ arr: [Character], _ x: Int, _ y: Int) -> Bool {
        var a = arr
        for i in 0 ..< a.count {
            for j in i+1 ..< a.count {
                a.swapAt(i, j)
                if let num = Int(String(a)), num == y || checkSwappedValues2(a, x, y) {
                    return true
                }
                a.swapAt(i, j) // Swap back to restore the original order
            }
        }
        return false
    }
    
    func checkSwappedValues2(_ arr: [Character], _ x: Int, _ y: Int) -> Bool {
        var a = arr
        for i in 0 ..< a.count {
            for j in i+1 ..< a.count {
                a.swapAt(i, j)
                if let num = Int(String(a)), num == y {
                    return true
                }
                a.swapAt(i, j) // Swap back to restore the original order
            }
        }
        return false
    }
}