class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }

        var i = 1
        while true {
            if x - i*i >= 0 && x - (i+1)*(i+1) < 0 {
                return i
            }
            i += 1
        }
    }
}