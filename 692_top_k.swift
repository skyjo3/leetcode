class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var hash : [String:Int] = [:]
        
        // add the words based on their occurences
        for w in words {
            hash[w, default:0] += 1
        }

        // sort the hashmap
        let sortedWords = hash.sorted { (first, second) -> Bool in
            if first.value == second.value {
                return first.key < second.key
            }
            return first.value > second.value
        }

        // prepare answer
        var arr : [String] = []
        for i in 0..<k {
            arr.append(sortedWords[i].key)
        }

        // return array of words with size == k
        return arr
    }
}