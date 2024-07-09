/**
 * @param {string} haystack
 * @param {string} needle
 * @return {number}
 */
var strStr = function(haystack, needle) {
    let diff = haystack.length - needle.length
    if (diff < 0) {
        return -1
    }
    for (let i = 0; diff - i >= 0; i++) {
        if (haystack.charAt(i) == needle.charAt(0)) {
            if (needle.length == 1) {
                return i
            }
            for (let j = 1; j < needle.length; j++) {
                if (haystack.charAt(i+j) == needle.charAt(j)) {
                    if (j == needle.length - 1) {
                        return i
                    }
                } else {
                    break
                }
            }
        }
    }
    return -1
};