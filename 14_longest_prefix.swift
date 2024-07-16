class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        var p = strs[0]

        // a loop to go through the words
        for str in strs[1...] {
            while !str.hasPrefix(p) {
                p = String(p.dropLast())
                if p == "" {
                    return ""
                }
            }
        }
        return p
    }
}