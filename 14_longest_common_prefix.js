/**
 * @param {string[]} strs
 * @return {string}
 */
var longestCommonPrefix = function(strs) {
    let str = strs[0]
    let res = ""

    for(let j = 0; j < str.length; j++) {
        for(let i = 0; i < strs.length; i++) {
            if (strs[i].charAt(j) != str.charAt(j)) {
                return res
            }
        }
        res += str.charAt(j)
    }
    return res
};