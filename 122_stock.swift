// Solution 2: Add whenever it's positive
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxVal = 0 // add only when it's positive
        for i in 1..<prices.count {
            let profit = prices[i] - prices[i-1]
            if profit > 0 { maxVal += profit }
        }
        return maxVal
    }
}