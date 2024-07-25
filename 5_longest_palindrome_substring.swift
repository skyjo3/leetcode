class Solution {
    func longestPalindrome(_ s: String) -> String {
        // Solution 2: Two Pointers
        var arr = Array(s)
        var maxVal = 0
        var maxStr = ""

        for i in 0..<arr.count {
            // odd cases
            var l_index = i
            var r_index = i
            while l_index >= 0 && r_index < arr.count && arr[l_index] == arr[r_index] {
                if maxVal < arr[l_index...r_index].count {
                    maxStr = String(arr[l_index...r_index])
                    maxVal = maxStr.count
                }
                l_index -= 1
                r_index += 1
            }
            // even cases
            l_index = i
            r_index = i + 1
            while l_index >= 0 && r_index < arr.count && arr[l_index] == arr[r_index] {
                if maxVal < arr[l_index...r_index].count {
                    maxStr = String(arr[l_index...r_index])
                    maxVal = maxStr.count
                }
                l_index -= 1
                r_index += 1
            }
        }

        return maxStr
        

        // Solution 1: Brute Force
        // var arr = Array(s)
        // var maxVal = ""

        // for i in 0..<arr.count {
        //     for j in i..<arr.count {
        //         let sub = String(arr[i...j])
        //         if isPalindrome(sub) && sub.count > maxVal.count {
        //             maxVal = sub
        //         }
        //     }
        // }
        // return maxVal
    }
    func isPalindrome(_ s: String) -> Bool {
        let a = Array(s)
        var c = a.count / 2
        
        if a.count % 2 == 0 {
            c -= 1
        }
        
        for i in 0...c {
            if a[i] != a[s.count-1-i] {
                return false
            }
        }
        return true
    }
}