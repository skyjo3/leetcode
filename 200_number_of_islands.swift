class Solution {
  // Solution: BFS
    func numIslands(_ grid: [[Character]]) -> Int {
        var islands = grid
        var count = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if islands[i][j] == "1" {
                    count += 1
                    checkIslands(&islands, i, j)            
                }
            }
        }
        return count
    }
    func checkIslands(_ islands: inout [[Character]],_ x: Int,_ y: Int) {
        if islands[x][y] == "1" {
            islands[x][y] = "0"
            if x-1 >= 0 { checkIslands(&islands, x-1, y) }
            if y-1 >= 0 { checkIslands(&islands, x, y-1) }
            if y+1 < islands[0].count { checkIslands(&islands, x, y+1) }
            if x+1 < islands.count { checkIslands(&islands, x+1, y) }
        }          
    }
}