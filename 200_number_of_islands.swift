class Solution {

    var islands = [[Character]]()
    var count = 0
    
    private func checkIslands (_ x: Int, _ y: Int) {

        if x != 0 { // check top
            if islands[x-1][y] == "1" {
                islands[x-1][y] = "0"
                checkIslands(x-1, y)
            }
        }

        if x != islands.count-1 { // check bottom
            if islands[x+1][y] == "1" {
                islands[x+1][y] = "0"
                checkIslands(x+1, y)
            }
        }

        if y != 0 { // check left
            if islands[x][y-1] == "1" {
                islands[x][y-1] = "0"
                checkIslands(x, y-1)
            }
        }

        if y != islands[0].count-1 { // check right
            if islands[x][y+1] == "1" {
                islands[x][y+1] = "0"
                checkIslands(x, y+1)
            }
        }
    }

    func numIslands(_ grid: [[Character]]) -> Int {

        islands = grid
        
        for i in 0..<islands.count {
            for j in 0..<islands[i].count {
                if islands[i][j] == "1" { 
                    count += 1
                    checkIslands(i, j)
                }
            }
        }
        return count
    }
}