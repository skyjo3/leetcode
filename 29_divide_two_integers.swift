class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        var sum = 0
        var count = 0
        let isDividendNeg = dividend < 0 ? -1 : 1
        let isDivisorNeg = divisor < 0 ? -1 : 1
        let d1 = abs(dividend)
        let d2 = abs(divisor)

        while sum <= d1 {
            sum += d2
            count += 1
        }

        if isDividendNeg * isDivisorNeg < 0 {
            return -(count-1)
        }
        return count-1
    }
}