/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[]}
 */
var intersect = function(nums1, nums2) {
    var array = []
    var pt1 = 0
    var pt2 = 0

    nums1.sort((a, b) => a - b)
    // console.log(nums1)
    nums2.sort((a, b) => a - b)
    // console.log(nums2)

    if (nums1.length < nums2.length) {
        let temp = nums1
        nums1 = nums2
        nums2 = temp
    }

    for (pt1=0; pt1<nums1.length; pt1++) {
        // console.log("pt1 %d: %d; pt2 %d: %d", pt1, nums1[pt1], pt2, nums2[pt2])

        if (nums1[pt1] == nums2[pt2]) {
            array.push(nums1[pt1])
            // console.log("push and removed: %d\n", nums1[pt1])
            nums1.splice(pt1, 1)
            nums2.splice(pt2, 1)
            pt1 -= 1
            continue
        } else {
            // console.log("nothing\n")
        }

        if (nums2[pt2] < nums1[pt1]) {
            while (nums2[pt2] < nums1[pt1]) {
                pt2 += 1
            }
            pt1 -= 1
        }
    }
    return array
};