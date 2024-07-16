class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // Solution: Sliding Window
        if s.isEmpty {
            return 0
        }

        let arr = Array(s)
        var set1 : Set<Character> = []
        var l_index = 0
        var r_index = 0
        var maxCount = 0

        repeat {
            if set1.contains(arr[r_index]) {
                let char = arr[r_index]
                var substring = arr[l_index..<r_index]
                while substring.contains(char) {
                    if char != arr[l_index] {
                        set1.remove(arr[l_index])
                    }
                    l_index += 1
                    substring = arr[l_index..<r_index]
                }
            } else {
                set1.insert(arr[r_index])
                if set1.count > maxCount {
                    maxCount = set1.count
                }
            }
            r_index += 1
        } while r_index < arr.count

        return maxCount
    }
}