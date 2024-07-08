/**
 * @param {number} n
 * @return {number}
 */
var numSquares = function(n) {
    
    // Solution 1. brutal force
    // a while loop starting from 1, and replace the min until the calculation exceeds the number n (O(square root of n))
    let ps = 1 // perfect square
    let queue = [1]
    let sum = 1 // starting from one
    // prepare the perfect square queue
    while (sum <= n) {
        ps += 1
        sum = ps * ps
        if (sum > n) {
            break
        }
        queue.push(sum)
    }
    //console.log(queue)
    
    let min = n // minimum output: n x 1
    substract(0, n)

    function substract(depth, currentSum) {
        if (depth+1 >= min) {
            return
        }
        // faster to start from the last element
        for(let i=queue.length-1; i>=0; i--) {
            let result = currentSum - queue[i]
            if (result > 0) {
                substract(depth+1, result)
            } else if (result == 0) {
                if (depth < min) {
                    min = depth+1
                    //console.log([min, currentSum])
                }
            }
        }
    }
    return min

    // Solution 2. binary search? 
    // for number between 1 and 10,000 (perfect number between 1 and 100) (O(log n))
    // NOTE: decided not to proceed with this path because we still need to calculate ps*ps for the queue any way.
    
};