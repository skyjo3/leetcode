class Solution {

    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        var list : [Character] = ["1","2","3","4","5","6","7","8","9"]

        // Solution 1: Brutal Force
        // check horizontally
        for i in 0...8 {
            var l = list
            for j in  0...8 {
                if l.contains(board[i][j]) {
                    if let index = l.firstIndex(of: board[i][j]) {
                        l.remove(at: index)
                    }
                } else if board[i][j] != "." {
                    return false
                }
            }
            print("pass \(i) horizontally")
        }        

        // check vertically
        for i in 0...8 {
            var l = list
            for j in  0...8 {
                if l.contains(board[j][i]) {
                    if let index = l.firstIndex(of: board[j][i]) {
                        l.remove(at: index)
                    } 
                } else if board[j][i] != "." {
                    return false
                }
            }
            print("pass \(i) vertically")
        }

        // check the 9 3x3 boxes
        for k in 0...2 {
            for g in 0...2 {
                var l = list
                for i in 0...2 {
                    for j in  0...2 {
                        if l.contains(board[k*3+j][g*3+i]) {
                            if let index = l.firstIndex(of: board[k*3+j][g*3+i]) {
                                l.remove(at: index)
                            }
                        } else if board[k*3+j][g*3+i] != "." {
                            return false
                        }
                    }
                }
                print("pass the \(k),\(g) box")
            }
        }
        return true
    }
}