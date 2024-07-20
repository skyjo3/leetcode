class Solution {
    func myAtoi(_ s: String) -> Int {
        let arr = Array(s)
        var res : Int = 0
        var isNeg = false
        var step = 1
        var i = 0
        
        outerloop: while i < arr.count {
            if step == 1 {
                if arr[i] != " " { step = 2; continue }
            } else if step == 2 {
                switch arr[i] {
                    case "+": step = 3; 
                    case "-": step = 3; isNeg = true 
                    default: step = 3; continue 
                }
            } else if step == 3 {
                let element = String(arr[i])
                if Int(element) != nil && Int(element) != 0 {
                    res *= 10
                    res += Int(element)!
                    
                    // step 4
                    if res > Int(Int32.max) {
                        res = Int(Int32.max)
                        if isNeg { res += 1 }
                        break outerloop
                    }
                } 
                else if Int(element) == 0 && res != 0 {
                    res *= 10
                    
                    // step 4
                    if res > Int(Int32.max) {
                        res = Int(Int32.max)
                        if isNeg { res += 1 }
                        break outerloop
                    }
                } 
                else {
                    switch arr[i] {
                        case "0": break
                        default: break outerloop
                    }
                }
            }
            i += 1
        }
        res = isNeg ? res*(-1) : res
        // print(res)
        // print(Int32.min, Int32.max)
        
        return res
    }
}