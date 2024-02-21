class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        
        if intervals.isEmpty { return true }
        
        let intervals = intervals.sorted { $0[0] < $1[0] }
        
        for i in 1..<intervals.count {
            if intervals[i-1][1] > intervals[i][0] {
                return false
            }
        }
        return true
    }
}