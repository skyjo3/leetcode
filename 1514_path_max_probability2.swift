class Solution {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start_node: Int, _ end_node: Int) -> Double {
        var adj : [Int:[(Int, Double)]] = [:]
        for i in 0 ..< edges.count {
            if var arr = adj[edges[i][0]] {
                arr.append((edges[i][1], succProb[i]))
                adj[edges[i][0]] = arr
            } else {
                adj[edges[i][0]] = [(edges[i][1], succProb[i])]
            }
            if var arr = adj[edges[i][1]] {
                arr.append((edges[i][0], succProb[i]))
                adj[edges[i][1]] = arr
            } else {
                adj[edges[i][1]] = [(edges[i][0], succProb[i])]
            }
        }

        var pq = [(1.0, start_node)]
        var visit : Set<Int> = []

        while pq.count != 0 {
            let (prob, cur) = pq.removeFirst()
            visit.insert(cur)

            if cur == end_node {
                return prob
            }

            if let list = adj[cur] {
                for l in list {
                    let (nei, edgeProb) = l
                    if !visit.contains(nei) {
                        pq.append((prob * edgeProb, nei))
                        pq.sort { $0.0 > $1.0 }
                    }
                }
            }
        }

        return 0
    }
}