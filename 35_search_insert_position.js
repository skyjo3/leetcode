/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var searchInsert = function(nums, target) {
    
    let left = 0, right = nums.length-1
    let mid = Math.floor((left+right)/2)

    while (true) {
        let temp = mid
        if (target == nums[mid]) {
            return mid
        }

        // check edges
        if (target < nums[left]) {
            return left
        } else if (target > nums[right]) {
            return right+1
        }
            
        // reset range
        if (target < nums[mid]) {
            right = mid
        } else {
            left = mid
        }
        mid = Math.floor((left+right)/2)

        // check if the pointer moves
        if (temp == mid) {
            mid++
            if (right - left == 1) {
                if (target <= nums[right]) {
                    return right
                } else {
                    return right + 1
                } 
            }
        }
    }
};