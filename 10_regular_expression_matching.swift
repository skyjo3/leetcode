class Solution {
    var s1 : [Character] = []
    var p1 : [Character] = []
    var star = ""
    var cache: [Key: Bool] = [:]

    struct Key: Hashable {
        let i: Int
        let j: Int
    }

    func isMatch(_ s: String, _ p: String) -> Bool {
        s1 = Array(s)
        p1 = Array(p)
        return dfs(0,0)
    }
    func dfs (_ i: Int, _ j: Int) -> Bool {
        let key = Key(i: i, j: j)
        if let cachedResult = cache[key] { return cachedResult }

        if i >= s1.count && j >= p1.count { return true }
        else if j >= p1.count { return false }

        let match = i < s1.count && (s1[i] == p1[j] || p1[j] == ".")
        if j+1 < p1.count && p1[j+1] == "*" {
            cache[key] = ( dfs(i,j+2) || match && dfs(i+1,j) )
            return cache[key]!
        }
        if match {
            cache[key] = dfs(i+1,j+1)
            return cache[key]!
        }
        cache[key] = false
        return false
    }
}