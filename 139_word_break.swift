class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        // Solution 1: Brutal Force
        return checkWord(s, wordDict)

        // Solution 2: Two Pointer
        var l = 0
        var r = s.count - 1
        var arr = Array(s)

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