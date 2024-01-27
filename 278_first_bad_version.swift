/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var min = 1
        var max = n
        var index = n / 2

        repeat {
            print("index: \(index)")

            if isBadVersion(index) {
                max = index
                if !isBadVersion(index-1) {
                    return index
                }
                index = min + (max - min) / 2
                print("max: \(max), min: \(min)")
                continue
            } 
            min = index + 1

            if isBadVersion(index+1) {
                return index + 1
            }
            index = min + (max - min) / 2
            print("max: \(max), min: \(min)\n")

        } while min < max

        return 0
    }

}