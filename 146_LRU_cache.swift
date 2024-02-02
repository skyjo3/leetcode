class Node {
    var key: Int
    var val: Int
    var prev: Node?
    var next: Node?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}
class LRUCache {

    // FIFO approach
    // if there are calls about an old data, update the array order: [oldest ~ latest]
    // always remove from first, and add at the end

    var cache: [Int:Node] = [:]
    var size = 0
    var count = 0
    var head: Node? // the latest node
    var tail: Node? // the oldest node

    init(_ capacity: Int) {
        size = capacity    
    }
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            // change order: move this node to the latest one in list
            moveToHead(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        // check if key exists in the cache
        if let node = cache[key] {
            // change order
            node.val = value
            moveToHead(node)
        } else {
            // add new node to the top
            addToHead(key, value)
        }
        if count > size {
            // remove the oldest node
            cache[tail!.key] = nil
            tail = tail?.prev
            tail?.next = nil  
            count -= 1
        } 
        // print(cache)
    }

    func moveToHead(_ node: Node) {
        if node === head {
            return
        } else {
            // remove from original location
            node.prev?.next = node.next
            node.next?.prev = node.prev
            // insert to the top
            node.next = head
            head?.prev = node
            head = node
        }
        if node === tail {
			tail = tail?.prev
			tail?.next = nil
		}
    }

    func addToHead(_ key: Int, _ val: Int) {
        // add the new node to the top
        let node = Node(key, val)
        node.next = head
        head?.prev = node
        head = node
        cache[key] = node
        count += 1
        if tail == nil {
            tail = head
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */