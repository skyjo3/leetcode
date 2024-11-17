class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var arr = [1]
        for i in 0..<rowIndex {
            var cur = 1
            for j in 1..<arr.count {
                let temp = arr[j]
                arr[j] = cur + arr[j]
                cur = temp
            }
            arr.append(1)
        }
        return arr
    }
}