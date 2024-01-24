class Solution {

    func isPalindrome(_ s: String) -> Bool {
        let result = s.lowercased().filter("0123456789abcdefghijklmnopqrstuvwxyz".contains)
        let arrayResult = Array(result)
        for index in 0..<arrayResult.count {
            if (arrayResult[index] != arrayResult[arrayResult.count-1-index]) {
                return false
            }
        }
        return true
    }
}