class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        generateParenthesisHelper("", n, n, &result)
        return result
    }

    private func generateParenthesisHelper(_ current: String, _ leftCount: Int, _ rightCount: Int, _ result: inout [String]) {
        // Base case: if no more parentheses are left to add
        if leftCount == 0 && rightCount == 0 {
            result.append(current)
            return
        }

        // If there are left parentheses remaining, add one and recurse
        if leftCount > 0 {
            generateParenthesisHelper(current + "(", leftCount - 1, rightCount, &result)
        }

        // If there are more right parentheses remaining than left, add one and recurse
        if rightCount > leftCount {
            generateParenthesisHelper(current + ")", leftCount, rightCount - 1, &result)
        }
    }
}

// Test the function
let solution = Solution()
print(solution.generateParenthesis(1))
print(solution.generateParenthesis(2))
print(solution.generateParenthesis(3)) // Expected output: ["((()))","(()())","(())()","()(())","()()()"]
print(solution.generateParenthesis(4))
print(solution.generateParenthesis(5))