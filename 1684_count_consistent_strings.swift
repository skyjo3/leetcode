class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        var s1 : Set<Character> = []
        let arr = Array(allowed)
        for i in 0 ..< arr.count {
            s1.insert(arr[i])
        }
        var count = 0
        for w in words {
            let wordArr = Array(w)
            for i in 0 ..< wordArr.count {
                if !s1.contains(wordArr[i]) {
                    break
                }
                if i == wordArr.count - 1 {
                    count += 1
                }
            }
        }
        return count
    }
}