class Solution {
    func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
        let sum = chalk.reduce(0,+)
        var r = k % sum
        for i in 0 ..< chalk.count {
            if chalk[i] > r {
                return i
            }
            r -= chalk[i]
        }
        return 0
    }
}