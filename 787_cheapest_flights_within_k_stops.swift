class Solution {
    // Solution 3: Neetcode (Bellman-Ford > Djkstra Algorithm)
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var prices = Array(repeating: Int.max, count: n)
        prices[src] = 0

        for i in 1...k+1 {
            var tempPrices = prices

            for f in flights {
                var s = f[0]
                var d = f[1]
                var p = f[2]
                if prices[s] == Int.max {
                    continue // don't care about anything other than starting from 'src'
                }
                if prices[s] + p < tempPrices[d] {
                    tempPrices[d] = prices[s] + p
                }
            }
            prices = tempPrices
        }
        return prices[dst] == Int.max ? -1 : prices[dst]
    }

    // Solution 2: Without Hashmap
    // var globalMin = Int.max
    // func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
    //     var hash = flights
    //     let m = dfs(src, dst, 0, k, -1, &hash)
    //     return m == Int.max ? -1 : m
    // }
    // func dfs (_ start: Int, _ f: Int, _ cost: Int, _ k: Int, _ stop: Int,_ hash: inout [[Int]]) -> Int {
    //     // base case
    //     if start == f { globalMin = min(globalMin, cost); return cost }
    //     else if stop >= k { return Int.max }
    //     else if cost >= globalMin { return Int.max }

    //     // options - every option in the hash
    //     var minVal = Int.max
    //     for h in hash where h[0] == start {
    //         minVal = min(minVal, dfs(h[1], f, cost+h[2], k, stop+1, &hash))
    //     }

    //     // return cheapest
    //     return minVal
    // }

    // Solution 1: Nested Hashmap
    // func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        
    //     // hashmap recording every city's options
    //     var hash : [Int:[Int:Int]] = [:] // city index: [dest.city : price]
    //     for i in 0..<flights.count {
    //         var innerHash : [Int:Int] = hash[flights[i][0]] ?? [:]
    //         innerHash[flights[i][1]] = flights[i][2]            
    //         hash[flights[i][0]] = innerHash
    //     }
    //     // starting from the origin, and then go into every option (dfs)
    //     let m = dfs(src, dst, 0, k, -1, &hash)
    //     return m == Int.max ? -1 : m
    // }
    // func dfs (_ start: Int, _ f: Int, _ cost: Int, _ k: Int, _ stop: Int,_ hash: inout [Int:[Int:Int]]) -> Int {
    //     // base case
    //     if start == f { return cost }
    //     else if stop >= k { return Int.max }

    //     // options - every option in the hash
    //     var minVal = Int.max
    //     if let options = hash[start] {
    //         for h in options {
    //             minVal = min(minVal, dfs(h.key, f, cost+h.value, k, stop+1, &hash))
    //         }
    //     }

    //     // return cheapest
    //     return minVal
    // }
}