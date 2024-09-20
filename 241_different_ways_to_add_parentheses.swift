class Solution {
    func diffWaysToCompute(_ expression: String) -> [Int] {
        var arr = Array(expression)
        
        var num : [Int] = []
        var op : [Character] = []
        
        var i = 0
        var n1 = 0
        
        for i in 0 ..< arr.count {
            switch String(arr[i]) {
                case "+", "-", "*":
                num.append(n1)
                n1 = 0
                op.append(arr[i])
                default:
                n1 = n1*10 + Int(String(arr[i]))!
                if i == arr.count - 1 { num.append(n1) }
            }
        }
        // print(num, op)
        return dfs(num, op)
    }

    func dfs(_ num: [Int], _ op: [Character]) -> [Int] {
        if op.isEmpty {
            return [num[0]]
        }
        
        var results: [Int] = []
        
        for i in 0 ..< op.count {
            let leftResults = dfs(Array(num[0...i]), Array(op[0..<i]))
            let rightResults = dfs(Array(num[i+1..<num.count]), Array(op[i+1..<op.count]))
            
            for left in leftResults {
                for right in rightResults {
                    var result = 0
                    switch op[i] {
                        case "+":
                            result = left + right
                        case "-":
                            result = left - right
                        case "*":
                            result = left * right
                        default:
                            break
                    }
                    results.append(result)
                }
            }
        }
        return results
    }

    // func dfs(_ n: [Int], _ o: [Character]) -> [Int] {
    //     if o.count == 0 {
    //         return [n[0]]
    //     }
    //     var res : [Int] = []
    //     for i in 0 ..< o.count {
    //         var newNum = 0
    //         var num = n
    //         var op = o
    //         if String(op[i]) == "+" {
    //             newNum = num[i] + num[i+1]
    //         } else if String(op[i]) == "-" {
    //             newNum = num[i] - num[i+1]
    //         } else if String(op[i]) == "*" {
    //             newNum = num[i] * num[i+1]
    //         }
    //         // remove 2 nums and 1 op
    //         num.remove(at:i)
    //         op.remove(at:i)
    //         num.remove(at:i)
    //         num.insert(newNum, at:i)
    //         // get the return value from dfs
    //         res += dfs(num, op)
    //     }

    //     return res
    // }
}