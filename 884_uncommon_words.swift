class Solution {
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        var set1 : Set<String> = []
        var set2 : Set<String> = []
        var set3 : Set<String> = []
        var arr1 = s1.split(separator: " ")
        var arr2 = s2.split(separator: " ")
        
        for i in 0 ..< arr1.count {
            if set1.contains(String(arr1[i])) {
                set3.insert(String(arr1[i]))
            }
            set1.insert(String(arr1[i]))
        }
        for i in 0 ..< arr2.count {
            if set2.contains(String(arr2[i])) {
                set3.insert(String(arr2[i]))
            }
            set2.insert(String(arr2[i]))
        }
        var res = set1.symmetricDifference(set2)
        res.subtract(set3)
        return Array(res)
    }
}