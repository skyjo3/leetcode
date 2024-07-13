class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        
        Solution 1: O(row x col)

        var sticks = 0
        // loop over the rows of grid
        for i in 0..<grid.count {
            // loop over the columns of grid
            for j in 0..<grid[0].count {
                // whenever the grid element is 1, check if its adjacent elements are 1.
                if (grid[i][j] == 0) {
                    continue
                }
                sticks += 4
                // UP
                if i != 0 {
                    if grid[i-1][j] == 1 {
                        sticks -= 1
                    }
                }
                // DOWN
                if i != grid.count-1 {
                    if grid[i+1][j] == 1 {
                        sticks -= 1
                    }
                }
                // LEFT
                if j != 0 {
                    if grid[i][j-1] == 1 {
                        sticks -= 1
                    }
                }
                // RIGHT
                if j != grid[0].count-1 {
                    if grid[i][j+1] == 1 {
                        sticks -= 1
                    }
                }
            }
        }
        return sticks
    }
}