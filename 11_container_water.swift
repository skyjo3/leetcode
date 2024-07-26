class Solution {
    func maxArea(_ height: [Int]) -> Int {
        // Solution 2: Two Pointer - O(n)        
        var maxVal = 0
        var l = 0
        var r = height.count - 1

        while l < r {
            let area = (r-l) * min(height[l], height[r])
            maxVal = max(maxVal, area)
            if height[l] <= height[r] { l += 1 }
            else { r -= 1 }
        }
        return maxVal

        // Solution 1: Brute Force - O(n^2)
        // area = distance between indices x min(height[i1], height[i2])
        //
        // var maxVal = 0
        // for i in 0..<height.count {
        //     for j in i..<height.count {
        //         let area = (j-i)*min(height[i],height[j])
        //         maxVal = max(maxVal, area)
        //     }
        // }
        // return maxVal
    }
}