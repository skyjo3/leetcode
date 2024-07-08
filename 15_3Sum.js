/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var threeSum = function(nums) {
    let l_index = 0
    let ans = []

    // find triplets
    while (l_index != nums.length-2) {
        let m_index = l_index+1
        while (m_index != nums.length-1) {
            let r_index = m_index+1
            while(r_index != nums.length) {
                // console.log(l_index, m_index, r_index)
                if (nums[l_index] + nums[m_index] + nums[r_index] == 0) {
                    let sortedAns = [nums[l_index], nums[m_index], nums[r_index]]
                    sortedAns.sort((a, b) => (a - b))
                    if (ans.length == 0) {
                        ans.push(sortedAns)
                    } else {
                        // check if there is duplicate
                        let hasDuplicate = false
                        for (let i=0; i<ans.length; i++) {
                            if (isArrayEqual(ans[i], sortedAns)) {
                                hasDuplicate = true
                                break
                            }
                        }
                        if (!hasDuplicate) {
                            ans.push(sortedAns)
                            // console.log('answer added: ' + sortedAns)
                        } else {
                            // console.log('answer not added: ' + sortedAns)
                        }
                    }
                }
                r_index += 1
            }
            m_index += 1
        }
        l_index += 1
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
};