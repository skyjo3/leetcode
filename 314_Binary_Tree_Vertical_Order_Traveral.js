/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number[][]}
 */

var verticalOrder = function(root) {
    
    if (root == null) {
        return []
    }

    var array = []
    var queue = [[root, 0]]
    var nodesByCol = []

    var index = 0

    while (queue.length != 0) {

        // access the node
        const temp = queue.shift()
        var node = temp[0]
        var index = temp[1]

        // create array if it doesn't exists
        if (!nodesByCol[index])
            nodesByCol[index] = []
        
        // add element to the array
        nodesByCol[index].push(node.val)
        
        // go on to the left child
        if (node.left !== null) {
            queue.push([node.left, index-1])
        }
        if (node.right !== null) {
            queue.push([node.right, index+1])
        }
    }

    // sort the columns based on its index
    const sortedColumns = Object.keys(nodesByCol).sort((a, b) => a - b)
    
    // add column arrays to the final array
    sortedColumns.forEach((key) => {
        array.push(nodesByCol[key]); // Use nodesByCol[key] instead of sortedColumns[key]
    });

    return array
};