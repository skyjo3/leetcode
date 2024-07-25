class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        // Solution 1: DFS
        // var maxVal = 0
        // dfs(1, bricks, ladders)
        // return maxVal

        // func dfs(_ index: Int, _ b: Int, _ l: Int) {
        //     if index >= heights.count {
        //         maxVal = max(maxVal, index-1)
        //         return
        //     }
        //     let diff = heights[index] - heights[index-1]
        //     if diff > 0 {
        //         if b >= diff {
        //             dfs(index+1, b-diff, l)
        //         }
        //         if l > 0 {
        //             dfs(index+1, b, l-1)
        //         }
        //         else { 
        //             maxVal = max(maxVal, index-1)
        //             return 
        //         }
        //     } else {
        //         dfs(index+1, b, l)
        //     }
        // }

        // Solution 2: Priority Queue & Array
        var distance = heights
        var distSum = 0
        var queue : [Int] = []
        var ladderArr : [Int] = []
        var l = ladders
        distance[0] = 0

        // iterate to set up distance and priority queue
        for i in 1..<heights.count {
            let diff = heights[i] - heights[i-1]
            if diff <= 0 {
                distance[i] = 0
            } else {
                distance[i] = diff
                if l > 0 {
                    distSum += diff
                    queue.append(diff)
                    queue.sort { $0 > $1 }
                }
                if distSum > bricks && l > 0 {
                    let ladder = queue.removeFirst()
                    ladderArr.append(ladder)
                    distSum -= ladder
                    l -= 1
                }
            }
        }

        // iterate distance and use ladders
        l = ladders
        var b = bricks
        var maxVal = 0

        for i in 1..<distance.count {
            if distance[i] != 0 {
                if ladderArr.contains(distance[i]) && l > 0 {
                    l -= 1
                } else if distance[i] <= b {
                    b -= distance[i]
                } else if l > 0 {
                    l -= 1
                } else {
                    return i-1
                }
            }
            maxVal = i
        }
        return maxVal
        
        // Solution 3: Heap
        var queue : [Int] = []
        var l = ladders
        var b = bricks

        for i in 1..<heights.count {
            
            let diff = heights[i] - heights[i-1]
            
            if diff <= 0 {
                continue
            }

            queue.append(diff)
            queue.sort { $0 > $1 }
            
            b -= diff
            if b < 0 {
                if l > 0 {
                    let extraBricks = queue.removeFirst()
                    b += extraBricks
                    l -= 1
                } else {
                    return i-1
                }
            }
        }
        return heights.count - 1
    }
}