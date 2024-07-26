class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var extra = 0
        var lc = 0
        var queue : [Character] = []
        var leftQ : [Int] = [] // record index of leftQ
        var arr = Array(s)
        
        for i in 0..<arr.count {
            switch arr[i] {
                case "(":
                    lc += 1
                    leftQ.append(i - extra)
                    queue.append("(")
                case ")":
                    if lc != 0 { 
                        lc -= 1
                        queue.append(")")
                    }
                    else { 
                        extra += 1
                        continue 
                    }
                default:
                    queue.append(arr[i])
            }
        }
        
        // remove extre "("
        for i in 0..<lc {
            let j = leftQ.removeLast()
            queue.remove(at: j)
        }
        return String(queue)
    }
}