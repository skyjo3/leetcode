class Solution {
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        // Solution 1: DFS
        var count = 0
        var visited = Array(repeating: Array(repeating: 0, count: grid2[0].count), count: grid2.count)
        
        for i in 0 ..< grid1.count {
            for j in 0 ..< grid1[0].count {
                if grid2[i][j] == 1 && visited[i][j] == 0 && checkSubIsland(grid1, grid2, &visited, i, j) {
                    count += 1
                }
            }
        }
        return count
    }
    func checkSubIsland(_ grid1: [[Int]], _ grid2: [[Int]], _ visited: inout [[Int]], _ x: Int, _ y: Int) -> Bool {
        if x < 0 || y < 0 || x == grid1.count || y == grid1[0].count || grid2[x][y] == 0 || visited[x][y] == 1 {
            return true
        }

        visited[x][y] = 1
        
        var isSubIsland = true

        if grid1[x][y] == 0 {
            isSubIsland = false
        }
        
        isSubIsland = isSubIsland && checkSubIsland(grid1, grid2, &visited, x+1, y)
        isSubIsland = isSubIsland && checkSubIsland(grid1, grid2, &visited, x-1, y)
        isSubIsland = isSubIsland && checkSubIsland(grid1, grid2, &visited, x, y+1)
        isSubIsland = isSubIsland && checkSubIsland(grid1, grid2, &visited, x, y-1)

        return isSubIsland
    }
}