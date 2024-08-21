class Solution {
    func kthDistinct(_ arr: [String], _ k: Int) -> String {
        guard k > 0 && k <= arr.count else { return "" }

        var set1 : Set<String> = []
        var res : [String] = []
        
        for i in 0..<arr.count {
            if !set1.contains(arr[i]) {
                set1.insert(arr[i])
                res.append(arr[i])
            } else {
                res = res.filter { $0 != arr[i] }
            }
            // print(i, set1, res)
        }
        return k-1 < res.count ? res[k-1] : ""
    }
}