class Solution {
    struct Direction {
        var x: Int
        var y: Int
    }
    let direction : [Direction] = [
        Direction(x: 0, y: 1), // right
        Direction(x: 1, y: 0), // down
        Direction(x: 0, y: -1), // left
        Direction(x: -1, y: 0) // top
    ]
    func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
        var res = Array(repeating: Array(repeating: -1, count: n), count: m)
        var h = head
        
        var x = 0
        var y = 0
        var d = 0
        
        while h != nil {
            res[x][y] = h?.val ?? -1

            x += direction[d].x
            y += direction[d].y
            h = h?.next

            if x == m || y == n || x == -1 || y == -1 || res[x][y] != -1 {
                x -= direction[d].x
                y -= direction[d].y
                d = (d+1) % 4
                x += direction[d].x
                y += direction[d].y
            }
        }
        return res
    }
}