class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i1 = m-1
        var i2 = n-1
        var p = m+n-1
        while i1 >= 0 && i2 >= 0 {
            if nums1[i1] <= nums2[i2] {
                nums1[p] = nums2[i2]
                p -= 1
                i2 -= 1
            } else if nums1[i1] > nums2[i2] {
                nums1[p] = nums1[i1]
                p -= 1
                i1 -= 1
            }
        }
        while i2 >= 0 {
            nums1[p] = nums2[i2]
            p -= 1
            i2 -= 1
        }
    }
}