class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: temperatures.count)
        var stack = [Int]()

        for i in 0..<temperatures.count {
            while !stack.isEmpty && temperatures[stack.last!] < temperatures[i] {
                let index = stack.removeLast()
                result[index] = i - index
            }
            stack.append(i)
        }
        return result
    }
}
// class Solution {
//     func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
//         var ans : [Int] = Array(repeating: 0, count: temperatures.count) // array of 0s
//         var queue : [Int] = [] // priority queue of indices (min...max)
        
//         for i in 0..<temperatures.count {
//             var k = 0
//             while k < queue.count {
//                 var q = queue[k]
//                 if temperatures[i] > temperatures[q] { 
//                     q = queue.remove(at: k)
//                     ans[q] = i - q
//                     continue
//                 }
//                 k += 1
//             }
//             queue.append(i)
//         }
//         return ans
//     }
// }