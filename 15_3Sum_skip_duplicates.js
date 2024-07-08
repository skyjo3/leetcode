/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var threeSum = function(nums) {
    let l_index = 0
    let ans = []

    nums.sort((a, b) => a - b) // O(n log n)
    // console.log(nums)

    // find triplets
    while (l_index < nums.length-2) {
        let m_index = l_index+1

        while (m_index < nums.length-1) {
            let r_index = m_index+1

            while(r_index < nums.length) {
                // console.log(l_index, m_index, r_index)
                
                if (nums[l_index] + nums[m_index] + nums[r_index] == 0) {
                    let temp_ans = [nums[l_index], nums[m_index], nums[r_index]]    
                    if (ans.length == 0) {
                        ans.push(temp_ans)
                    } else {
                        // check if there is duplicate
                        let hasDuplicate = false
                        for (let i=0; i<ans.length; i++) {
                            if (isArrayEqual(ans[i], temp_ans)) {
                                hasDuplicate = true
                                break
                            }
                        }
                        if (!hasDuplicate) {
                            ans.push(temp_ans)
                            // console.log('answer added: ' + temp_ans)
                        } else {
                            // console.log('answer not added: ' + temp_ans)
                        }
                    }
                }
                r_index = findNextIndex(r_index)
            }
            m_index = findNextIndex(m_index)
        }
        l_index = findNextIndex(l_index)
    }

    return ans

    function isArrayEqual(array1, array2) {
        for (let i=0; i<array1.length; i++) {
            if (array1[i] != array2[i]) {
                return false
            }
        }
        return true
    }

    function findNextIndex(index) {
        let new_index = index + 1
        while (nums[index] == nums[new_index]) {
            new_index += 1
        }
        return new_index
    }
};