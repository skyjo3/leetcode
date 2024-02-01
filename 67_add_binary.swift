class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var aArray = Array(a)
        var bArray = Array(b)
        var res : [Character] = []

        
        var lastA = aArray.popLast()
        var lastB = bArray.popLast()
        
        var carry = 0


        while lastA != nil || lastB != nil || carry > 0 {
            let sum = (lastA?.wholeNumberValue ?? 0) + (lastB?.wholeNumberValue ?? 0) + carry
            res.insert(Character("\(sum % 2)"), at: 0)
            carry = sum / 2
            
            lastA = aArray.popLast()
            lastB = bArray.popLast()
        }

        return String(res)
    }
}