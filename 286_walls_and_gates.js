/**
 * @param {number[][]} rooms
 * @return {void} Do not return anything, modify rooms in-place instead.
 */
var wallsAndGates = function(rooms) {
    // find and start from the gates
    let queue = [] // format: [x position, y position, distance]

    for (let i=0; i<rooms.length; i++) {
        for (let j=0; j<rooms[i].length; j++) {
            if (rooms[i][j] === 0) {
                queue.push([i, j, 0])
            }
        }
    }
    // traverse from the gates
    while (queue.length > 0) {
        // in each traverse, check the marked value and replace if fewer than the existing distance
        // console.log(queue)
        let [x, y, d] = queue.shift()
        // up
        if (x>0 && rooms[x-1][y] > d+1) {
            rooms[x-1][y] = d+1
            queue.push([x-1, y, d+1])
        }
        // down
        if (x<rooms.length-1 && rooms[x+1][y] > d+1) {
            rooms[x+1][y] = d+1
            queue.push([x+1, y, d+1])
        }
        // left
        if (y>0 && rooms[x][y-1] > d+1) {
            rooms[x][y-1] = d+1
            queue.push([x, y-1, d+1])
        }
        // right
        if (y<rooms[0].length-1 && rooms[x][y+1] > d+1) {
            rooms[x][y+1] = d+1
            queue.push([x, y+1, d+1])
        }
    }
};