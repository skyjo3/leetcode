class Solution {
    func longestPalindrome(_ s: String) -> Int {
        
        var a = Array(s)
        
        if a.count == 0 {
            return 0
        }

        var temp = [a[0]]
        var count = 0

        for i in 1..<a.count {
            if temp.count == 0 {
                temp.append(a[i])
                continue
            }
            for j in 0..<temp.count {
                if a[i] == temp[j] {
                    count += 2
                    temp.remove(at: j)
                    break
                } else if j == temp.count-1 {
                    temp.append(a[i])
                }
            }
        }

        if temp.count >= 1 {
            count += 1
        }

        return count
    }
}