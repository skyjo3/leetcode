/**
 * @param {number[]} nums
 * @return {number}
 */
var removeDuplicates = function(nums) {
    let sorted_queue = [nums[0]]
    for(let i = 1; i < nums.length; i++) {
        // binary search
        let left = 0
        let right = sorted_queue.length-1
        let j = Math.floor((left + right) / 2)
        while(true) {
            // console.log('--- i, j: ' + [i, j])
            let start = j
            if (nums[i] == sorted_queue[j]) { // value found in queue
                nums.splice(i, 1)
                i--
                // console.log('=== remove & skip')
                // console.log('nums: ' + nums)
                // console.log('sorted_queue: ' + sorted_queue + '\n')
                break
            } else if (nums[i] < sorted_queue[j]) { // continue searching in the left part
                right = j
                j = Math.floor((left + right) / 2)
            } else if (nums[i] > sorted_queue[j]) { // continue searching in the right part
                left = j
                j = Math.floor((left + right) / 2)
            }
            if (start == j) { // value not found in queue
                if (start < 2 || sorted_queue.length > start) {
                    j++
                    continue
                }
                sorted_queue.splice(j, 0, nums[i])
                // console.log('=== add & continue')
                // console.log('nums: ' + nums)
                // console.log('sorted_queue: ' + sorted_queue + '\n')
                break
            }
        }
    }
    return nums.length
};