class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hash : [String:[String]] = [:]
        
        for i in 0..<strs.count {
            var str = Array(strs[i])
            var sortedStr = str.sorted()
            var s = String(sortedStr)
            if hash.keys.contains(s) {
                hash[s]!.append(strs[i]) 
            } else {
                hash[s] = [strs[i]]
            }
        }
        var res : [[String]] = []
        for h in hash {
            res.append(h.value)
        }
        return res
    }
}