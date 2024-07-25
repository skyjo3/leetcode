class Solution {

    func isValidSudoku(_ board: [[Character]]) -> Bool {

        // Solution 1: Brutal Force        
        // var list : [Character] = ["1","2","3","4","5","6","7","8","9"]

        // // check horizontally
        // for i in 0...8 {
        //     var l = list
        //     for j in  0...8 {
        //         if l.contains(board[i][j]) {
        //             if let index = l.firstIndex(of: board[i][j]) {
        //                 l.remove(at: index)
        //             }
        //         } else if board[i][j] != "." {
        //             return false
        //         }
        //     }
        //     print("pass \(i) horizontally")
        // }        

        // // check vertically
        // for i in 0...8 {
        //     var l = list
        //     for j in  0...8 {
        //         if l.contains(board[j][i]) {
        //             if let index = l.firstIndex(of: board[j][i]) {
        //                 l.remove(at: index)
        //             } 
        //         } else if board[j][i] != "." {
        //             return false
        //         }
        //     }
        //     print("pass \(i) vertically")
        // }

        // // check the 9 3x3 boxes
        // for k in 0...2 {
        //     for g in 0...2 {
        //         var l = list
        //         for i in 0...2 {
        //             for j in  0...2 {
        //                 if l.contains(board[k*3+j][g*3+i]) {
        //                     if let index = l.firstIndex(of: board[k*3+j][g*3+i]) {
        //                         l.remove(at: index)
        //                     }
        //                 } else if board[k*3+j][g*3+i] != "." {
        //                     return false
        //                 }
        //             }
        //         }
        //         print("pass the \(k),\(g) box")
        //     }
        // }
        // return true

        // Solution 2: Hashset
        var rows : [[Character]] = Array(repeating: [Character](), count: 9)
        var cols : [[Character]] = Array(repeating: [Character](), count: 9)
        var boxes : [[[Character]]] = Array(repeating: Array(repeating: [Character](), count: 3), count: 3)

        for i in 0..<9 {
            for j in 0..<9 where board[i][j] != "." {
                if rows[i].contains(board[i][j]) ||
                    cols[j].contains(board[i][j]) || 
                    boxes[i/3][j/3].contains(board[i][j]) {
                        return false
                    }
                rows[i].append(board[i][j])
                cols[j].append(board[i][j])
                boxes[i/3][j/3].append(board[i][j])
            }
        }
        return true
    }
}