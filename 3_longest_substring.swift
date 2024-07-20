class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // Solution 1: Sliding Window
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
        
        // Solution 2: Stack
        var set1 : Set<Character> = []
        let arr = Array(s)
        var sub : [Character] = []
        var maxVal = 0
        
        for i in 0..<arr.count {
            if set1.contains(arr[i]) {
                while sub.contains(arr[i]) {
                    if sub[0] != arr[i] {
                        set1.remove(sub[0])
                    }
                    sub.removeFirst()
                }
                sub.append(arr[i])
            } else {
                set1.insert(arr[i])
                sub.append(arr[i])
                maxVal = max(maxVal, sub.count)
            }
        }
        return maxVal
    }
}