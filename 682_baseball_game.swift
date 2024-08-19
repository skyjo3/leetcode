class Solution {
    func calPoints(_ operations: [String]) -> Int {
        var total = 0
        var stack : [Int] = []
        for i in 0..<operations.count {
            if operations[i].isInteger {
                stack.append(Int(operations[i])!)
            } else {
                switch operations[i] {
                    case "+":
                    stack.append(stack[stack.count-1]+stack[stack.count-2])
                    case "D":
                    stack.append(stack[stack.count-1]*2)
                    case "C":
                    stack.removeLast()
                    default: 
                    print("n")
                }
            }
        }
        return stack.reduce(0,+)
    }
}
extension String {
    var isInteger: Bool {
        return Int(self) != nil
    }
}