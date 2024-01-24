class Solution {

    func isValid(_ s: String) -> Bool {
        
        var savedBrackets: [String] = []

        for bracket in Array(s) {
            if bracket == "(" || bracket == "[" || bracket == "{" {
                savedBrackets.append(String(bracket))
                continue
            } else {
                if bracket == ")" && savedBrackets.last == "(" {
                    savedBrackets.removeLast()
                    continue
                } else if bracket == "]" && savedBrackets.last == "[" {
                    savedBrackets.removeLast()
                    continue
                } else if bracket == "}" && savedBrackets.last == "{" {
                    savedBrackets.removeLast()
                    continue
                } else {
                    return false
                }
            }
        }

        if savedBrackets == [] {
            return true
        } else {
            return false
        }
    }
}