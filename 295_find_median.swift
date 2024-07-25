
class MedianFinder {
    var count : Int = 0
    var leftArr : [Int] = []
    var rightArr : [Int] = []
    var m1 : Int = 0
    var m2 : Int = 0

    init() {
        
    }
    
    func addNum(_ num: Int) {
        if count == 0 {
            m1 = num
        } else if count == 1 {
            if num > m1 {
                m2 = num
            } else {
                m2 = m1
                m1 = num
            }
        } else if count == 2 {
            if num < m1{
                leftArr.append(num)
                rightArr.append(m2)
            } else if num > m1 && num < m2 {
                leftArr.append(m1)
                m1 = num
                rightArr.append(m2)
            } else {
                leftArr.append(m1)
                m1 = m2
                rightArr.append(num)
            }
        } else if count % 2 == 1 {
            // case 1: num <= current median
            if num <= m1 {
                m2 = m1
                let leftMax = leftArr.removeLast()
                if leftMax > num {
                    m1 = leftMax
                    leftArr.append(num)
                    leftArr.sort { $0 < $1 }
                } else {
                    m1 = num
                    leftArr.append(leftMax)
                }
            }          
            // case 2: num > current median
            else {
                let rightMin = rightArr.removeLast()
                if rightMin < num {
                    m2 = rightMin
                    rightArr.append(num)
                    rightArr.sort { $0 > $1 }
                } else {
                    m2 = num
                    rightArr.append(rightMin)
                }
            }
        } else if count % 2 == 0 {
            // case 1: num <= current median
            if num <= m1 {
                leftArr.append(num)
                leftArr.sort { $0 < $1 }
                rightArr.append(m2)
            }
            // case 2: m1 < num < m2
            else if m1 < num && num <= m2 {
                leftArr.append(m1)
                rightArr.append(m2)
                m1 = num
            }
            // case 3: num > current median
            else {
                rightArr.append(num)
                rightArr.sort { $0 > $1 }
                leftArr.append(m1)
                m1 = m2
            }
            m2 = 0
        }
        count += 1
    }
    
    func findMedian() -> Double {
        if count % 2 == 1 {
            return Double(m1)
        } else {
            return Double(m1+m2)/2.0
        }
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */