/**
 * @param {string} s
 * @return {string}
 */
var reverseParentheses = function(s) {
    // loop
    let l_index_queue = []
    let l_index = -1
    let r_index = -1
    let index = 0
    let original_input = s

    while (index < original_input.length) {
        if (s[index] == '(') {
            l_index_queue.push(index)
            // console.log('l_index_queue: '+l_index_queue)
        } else if (s[index] == ')') {
            r_index = index
            l_index = l_index_queue.pop()
            let left_part = s.slice(0, l_index)
            let str = s.slice(l_index+1, r_index) // not including parentheses
            let right_part = s.slice(r_index+1, s.length)

            let reversedStr = str.split('').reverse().join('')
            s = left_part.concat(reversedStr).concat(right_part)
            index -= 2 // length - (2 parentheses)
            
            // console.log('s: '+s)
            // r_index = -1
            // l_index = -1
        }
        index++
    }
    return s
};