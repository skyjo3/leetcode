
class TwoSum {

    var s1 : Set<Int> = []
    var dict : [Int: Int] = [:] // number: times

    init() {
        
    }
    
    func add(_ number: Int) {
        if !s1.contains(number) {
            s1.insert(number)
            dict[number] = 1
        } else {
            dict[number]! += 1
        }
    }
    
    func find(_ value: Int) -> Bool {
        for num in s1 {
            if s1.contains(value-num) {
                if value-num != num || (value-num) == num && dict[num]!>1 {
                    return true
                }
            }
        }
        return false
    }
}

/**
 * Your TwoSum object will be instantiated and called as such:
 * let obj = TwoSum()
 * obj.add(number)
 * let ret_2: Bool = obj.find(value)
 */