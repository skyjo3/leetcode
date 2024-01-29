class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        
        var minArray = [[Int]]()
        var dArray = [Double]()
        var max = 0.00
        
        for i in 0..<points.count {
            var d = sqrt(Double(points[i][0]*points[i][0]+points[i][1]*points[i][1]))
            //print("d: \(String(format: "%.2f", d)), point: \(points[i]), k: \(k)")

            if i == 0 { // for the first point
                dArray.append(d)
                minArray.append(points[i])
                max = d
                //print("1st round : dArray: \(dArray)\nminArray: \(minArray), max: \(String(format: "%.2f", max))\n")
            } else if i < k { // for points within the number
                for j in 0..<dArray.count { // insert in a Min Heap
                    if d <= dArray[j] {
                        max = dArray.last!
                        dArray.insert(d, at:j)
                        minArray.insert(points[i], at:j)
                        //print("i < k : dArray: \(dArray)\nminArray: \(minArray), max: \(String(format: "%.2f", max))\n")
                        break
                    } else if j == dArray.count - 1 {
                        dArray.append(d)
                        minArray.append(points[i])
                        max = d
                        //print("i < k, j is last : dArray: \(dArray)\nminArray: \(minArray), max: \(String(format: "%.2f", max))\n")
                    }
                }
            } else { // when i >= k
                if d > max {
                    //print("d > max, continue")
                    continue
                } else { // update the Min Heap based on d
                    for j in 0..<dArray.count { // insert in a Min Heap
                        if d < dArray[j] {
                            dArray.insert(d, at:j)
                            minArray.insert(points[i], at:j)
                            //print("i >= k, d < max : dArray: \(dArray)\nminArray: \(minArray), max: \(String(format: "%.2f", max))\n")
                            break
                        }
                    }
                }
            }

            if dArray.count > k {
                dArray.removeLast()
                minArray.removeLast()
                max = dArray.last!
                //print("dArray.count > k, removeLast : dArray: \(dArray)\nminArray: \(minArray), max: \(String(format: "%.2f", max))\n")
            }

            //print("=== dArray: \(dArray)\nminArray: \(minArray), max: \(String(format: "%.2f", max))\n")
        }
        return minArray
    }
}