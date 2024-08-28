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
        
        // s1 variations
        var a1 = Array(String(x))
        for i in 0 ..< a1.count {
            for j in i+1 ..< a1.count {
                var a = a1
                let temp = a[i]
                a[i] = a[j]
                a[j] = temp
                if (Int(String(a)) == y) {
                    return true
                }
            }
        }

        // s2 variations
        var a2 = Array(String(y))
        for i in 0 ..< a2.count {
            for j in i+1 ..< a2.count {
                var a = a2
                let temp = a[i]
                a[i] = a[j]
                a[j] = temp
                if (Int(String(a)) == x) {
                    return true
                }
            }
        }

        return false
    }
}