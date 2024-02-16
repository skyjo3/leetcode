class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        
        let a = newInterval[0]
        let b = newInterval[1]

        var solutions: [[Int]] = []
        var newInterval = newInterval

        let isABApplied = false

        for i in 0..<intervals.count {
            let start = intervals[i][0]
            let end = intervals[i][1]

            if b < start {
                solutions.append(newInterval)
                solutions.append(contentsOf: Array(intervals[i..<intervals.count]))
                return solutions
            } else if a > intervals[i][1] {
                solutions.append(intervals[i])
            } else {
                let min = min(newInterval[0], intervals[i][0])
                let max = max(newInterval[1], intervals[i][1])
                newInterval = [min, max]
            }
        }

        solutions.append(newInterval)
        return solutions
    }
}