class Solution {
    var res = ""
    
    func intToRoman(_ num: Int) -> String {
        digitToRoman(num/1000, ["M"])
        digitToRoman(num/100%10, ["C","D","M"])
        digitToRoman(num/10%10, ["X","L","C"])
        digitToRoman(num%10, ["I","V","X"])
        return res
    }
    func digitToRoman(_ d: Int, _ romans: [String]) {
        // print(d)
        switch d {
            case 1: res += romans[0]
            case 2: res += romans[0] + romans[0]
            case 3: res += romans[0] + romans[0] + romans[0]
            case 4: res += romans[0] + romans[1]
            case 5: res += romans[1]
            case 6: res += romans[1] + romans[0]
            case 7: res += romans[1] + romans[0] + romans[0]
            case 8: res += romans[1] + romans[0] + romans[0] + romans[0]
            case 9: res += romans[0] + romans[2]
            default: break // 0
        }
        // print(res)
    }
}