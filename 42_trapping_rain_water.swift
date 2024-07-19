class Solution {

    // Solution 2: Successful Two Pointer
    func trap(_ height: [Int]) -> Int {
        var pL = 0
        var pR = height.count-1
        var maxL = height.first!
        var maxR = height.last!
        var water = 0

        while pL < pR {
            if maxL <= maxR { // left
                pL += 1
                water += max(0, maxL - height[pL])
                maxL = max(maxL, height[pL])
            } else { // right
                pR -= 1
                water += max(0, maxR - height[pR])
                maxR = max(maxR, height[pR])
            }
        }
        return water
    }
    
    /* ============================
    PLAN

    1. var water to count result
    2. two indices to record high point 1 and 2
        - h1: diff < 0
        - h2: diff > 0
    3. local lowArray (from h1+1 to h2-1)
    4.  - water += min(h1, h2) - lowArray[i]
    5. return water

     ============================ */

    // Solution 1: Failed Brutal Force
    // func trap(_ height: [Int]) -> Int {
    //     var water = 0
    //     var h1 : Int = 0
    //     var h2 : Int = 0
    //     var check = false
    //     var tempW = 0

    //     for i in 1..<height.count - 1 {
    //         let diff = height[i] - height[i-1]
    //         if !check && diff < 0 {
    //             h1 = i-1
    //             check = true
    //             tempW += (height[h1] - height[i])

    //         } else if diff <= 0 {
    //             tempW += (height[h1] - height[i])
            
    //         } else if diff > 0 {
    //             h2 = i
    //             check = false

    //             let extraW = (h2-h1-1)*(height[h1]-height[h2])
    //             let add_water = h1 < h2 ? tempW : tempW-extraW 
    //             water += add_water
    //             tempW = 0
    //         } 
    //     }

    //     return water
    // }
}