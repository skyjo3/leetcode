class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var arr: [String] = ["("]
        arr = addChar(arr, n-1, n)
        return arr
    }
    
    func addChar(_ arr: [String], _ leftCount: Int, _ rightCount: Int) -> [String] {
        
        // base case
        if leftCount == 0 && rightCount == 0 {
            return arr
        }

        var leftArr: [String] = []
        var rightArr: [String] = []

        // left? add '(' if there are remaining left parentheses to add
        if leftCount > 0 {
            for item in arr {
                let newItem = item + "(" 
                leftArr.append(newItem) 
            }
            leftArr = addChar(leftArr, leftCount - 1, rightCount) 
        }

        // right? add ')' if there are more right parentheses than left
        if rightCount > leftCount {
            for item in arr {
                let newItem = item + ")" 
                rightArr.append(newItem) 
            }
            rightArr = addChar(rightArr, leftCount, rightCount - 1) 
        }

        // return the concatenation of leftArr and rightArr
        return leftArr + rightArr
    }
}
