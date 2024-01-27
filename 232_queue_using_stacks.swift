
class MyQueue {

    var head: Int?
    var tail: Int?
    var array: [Int]
    var count: Int

    init() {
        head = nil
        tail = nil
        array = []
        count = 0
    }
    
    func push(_ x: Int) {
        if count == 0 {
            head = x
        }
        tail = x
        array.append(x)
        count += 1
    }
    
    func pop() -> Int {
        if count > 1 {
            var temp = array[0]
            head = array[1]
            array.removeFirst()
            count -= 1
            return temp
        } else if count == 1 {
            var temp = array[0]
            array.removeFirst()
            head = nil
            count -= 1
            return temp
        }
        count
        return 0
    }
    
    func peek() -> Int {
        if count != 0 {
            return head!
        }
        return 0
    }
    
    func empty() -> Bool {
        if array.count == 0 {
            return true
        }
        return false
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */