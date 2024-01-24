class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        for i in 0..<nums.count - 1 {
            for j in i..<nums.count where i != j {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
            
        }
        print("Something wrong. There's no solution.")
        return [0, target]
    }
}