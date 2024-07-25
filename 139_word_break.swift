class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        // Solution 1: Brute Force
        // return checkWord(s, wordDict)

        // Solution 2: Dynamic Programming
        var dp = Array(repeating: false, count: s.count+1)
        dp[s.count] = true

        for i in stride(from: s.count-1, to: -1, by: -1) {
            for w in wordDict {
                if i + w.count <= s.count {
                    let subArr = Array(s)
                    if w == String(subArr[i...i+w.count-1]) {
                        dp[i] = dp[i + w.count]
                    }
                }
                if dp[i] {
                    break
                }
            }
        }
        return dp[0]
    }

    func checkWord (_ str: String, _ wrds: [String]) -> Bool {
        // base case
        if str == nil {
            return true
        }

        var hasRes = false

        // update
        for w in wrds {
            if str.hasPrefix(w) {
                let arr = Array(str)
                // print(arr)
                if w.count != str.count {
                    var input = arr[w.count...str.count-1]
                    // print(input)
                    // branches
                    hasRes = hasRes || checkWord(String(input), wrds)
                } else { return true }
            }
        }
        return hasRes
    }

        
}
