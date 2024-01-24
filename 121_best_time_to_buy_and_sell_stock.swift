class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        var maxP = 0
        var buyMinIndex = 0

        for rightIndex in 1..<prices.count {
            let currentP = prices[rightIndex] - prices[buyMinIndex]   
            if prices[buyMinIndex] < prices[rightIndex] {
                maxP = max(maxP, prices[rightIndex] - prices[buyMinIndex])
            } else {
                buyMinIndex = rightIndex
            }
        }
        return maxP
    }
}