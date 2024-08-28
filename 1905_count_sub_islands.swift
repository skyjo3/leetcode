class Solution {
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        var count = 0
        var g1 = grid1
        var g2 = grid2
        var visited = Array(repeating: Array(repeating: 0, count: grid1[0].count), count: grid1.count)

        for i in 0 ..< grid1.count {
            for j in 0 ..< grid1[0].count {
                if g2[i][j] == 1 && visited[i][j] == 0 && isSubIsland(&g1, &g2, &visited, i, j) {
                    count += 1
                }
                // print(i, j, count)
                // printIsland(&g1, &g2, &visited)
            }
        }
        return count
    }
    func isSubIsland(_ g1: inout [[Int]], _ g2: inout [[Int]], _ visited: inout [[Int]],_ x: Int, _ y: Int) -> Bool {
        if x < 0 || y < 0 || x >= g1.count || y >= g1[0].count || g2[x][y] == 0 || visited[x][y] == 1 {
            return true
        }

        visited[x][y] = 1

        var isSI = true

        if g1[x][y] == 0 {
            isSI = false
        }

        isSI = isSubIsland(&g1, &g2, &visited, x+1, y) && isSI
        isSI = isSubIsland(&g1, &g2, &visited, x-1, y) && isSI
        isSI = isSubIsland(&g1, &g2, &visited, x, y+1) && isSI
        isSI = isSubIsland(&g1, &g2, &visited, x, y-1) && isSI
        
        return isSI
    }
    // func printIsland(_ g1: inout [[Int]], _ g2: inout [[Int]], _ visited: inout [[Int]]) {
    //     for i in 0 ..< visited.count {
    //         print("\(visited[i]) \(g1[i]) \(g2[i])")
    //     }
    // }
}