class Solution {
    func reverse(_ x: Int) -> Int {
        var res = 0
        var isNeg = x < 0 ? true : false
        var n = x < 0 ? -x : x

        while n/10 != 0 {
            res *= 10
            res += (n%10)
            n /= 10
        }
        res *= 10
        res += (n%10)

        let min : Int = Int(Int32.min) * -1
        let max : Int = Int(Int32.max)

        if ( isNeg && res > min ) || ( !isNeg && res > max ) { return 0 }
        if isNeg { return -res } else { return res }
    }
}