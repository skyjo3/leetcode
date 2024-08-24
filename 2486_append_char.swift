class Solution {
    func appendCharacters(_ s: String, _ t: String) -> Int {
        var ps = 0
        var pt = 0
        var s = Array(s)
        var t = Array(t)

        while ps < s.count && pt < t.count {
            if s[ps] == t[pt] {
                ps += 1
                pt += 1
            } else {
                ps += 1
            }
        }
        return t.count - pt
    }
}