class Solution {
    var maxVal : Double = 0.0
    var hash : [Int:Double] = [:]

    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start_node: Int, _ end_node: Int) -> Double {
        // priority queue
        var e : [[Int]] = [edges[0]]
        var s : [Double] = [succProb[0]]
        for i in 1 ..< edges.count {
            for j in 0 ..< s.count {
                if succProb[i] > s[j] {
                    s.insert(succProb[i], at: j)
                    e.insert(edges[i], at: j)
                    break
                } else if j == s.count - 1 {
                    s.append(succProb[i])
                    e.append(edges[i])
                }
            }
        }
        // print(e,s)
        // dfs
        return getMaxProbability(e, s, start_node, end_node, 1.0)
    }

    func getMaxProbability (_ e: [[Int]], _ s: [Double],_ n1: Int, _ n2: Int, _ curP: Double) -> Double {
        if n1 == n2 { return curP }
        if e.isEmpty { return 0 }

        for i in 0 ..< e.count where e[i].contains(n1) {
            
            let edge = e[i]
            let prob = s[i]
            let new1 = edge[0] == n1 ? edge[1] : edge[0]
            
            if let h = hash[new1], h <= maxVal, prob <= h {
                continue
            }
            
            if prob*curP > maxVal {
                var edges = e
                var probs = s

                edges.remove(at: i)
                probs.remove(at: i)

                let p = getMaxProbability(edges, probs, new1, n2, prob*curP)
                maxVal = max(maxVal, p)
                hash[new1] = p
            }
        }
        return maxVal
    }
}