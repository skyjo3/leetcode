/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func postorder(_ root: Node?) -> [Int] {
    	guard let r = root else { return [] }
        var arr : [Int] = []
        for i in 0 ..< r.children.count {
            arr += postorder(r.children[i])
        }
        arr.append(r.val)
        return arr
    }
}