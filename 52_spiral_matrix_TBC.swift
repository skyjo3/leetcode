class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        if matrix == [] {
            return []
        }

        // META NOTE:
        // using recursion to solve this problem
        // checked map [0,0... 1, 0, ...] 
        // 4 functions of going right, down, left, and up

        // a map that indicate which point has been traversed: 
        //  0 means we haven't traveled there; 
        //  1 means we've been there
        var checkedMap = [[Int]](repeating: (repeating: 0, count: n), count: m)

        // the traversed path array
        var path = []

        // starting from top left
        var currentX = 0
        var currentY = 0

        var shouldKeepGoing = true
        var direction = 0 // 0: right, 1: down, 2: left, 3: up

        while shouldKeepGoing {
            switch direction {
                case 0: // right
                print("right")
                shouldKeepGoing = checkedRight()
                case 1: // down
                print("down")
                shouldKeepGoing = checkedDown()
                case 2: // left
                print("left")
                shouldKeepGoing = checkedLeft()
                case 3: // up
                print("up")
                shouldKeepGoing = checkedUp()
                default: // ?
                print("sth wrong")
            }
            direction += 1 % 4
        }
        return path
    }

    func checkedRight () -> Bool {
        for i in currentX..<matrix.count {
            if checkedMap[i][currentY] == 0 {
                checkedMap[i][currentY] = 1
                path.append(matrix[i][currentY])
            } else {
                if currentY != matrix[0].count {
                    if checkedMap[i-1][currentY+1] == 0 {
                        return true
                    }
                }
            }
            return false
        }
    }

    func checkedDown () -> Bool {
        for i in currentX..<matrix.count {
            if checkedMap[i][currentY] == 0 {
                checkedMap[i][currentY] = 1
                path.append(matrix[i][currentY])
            } else {
                if currentY != matrix[0].count {
                    if checkedMap[i-1][currentY+1] == 0 {
                        return true
                    }
                }
            }
            return false
        }
    }

    func checkedLeft () -> Bool {
        for i in stride(from: currentX, to: 0, by: -1) {
            if checkedMap[i][currentY] == 0 {
                checkedMap[i][currentY] = 1
                path.append(matrix[i][currentY])
            } else {
                if currentY != matrix[0].count {
                    if checkedMap[i-1][currentY+1] == 0 {
                        return true
                    }
                }
            }
            return false
        }
    }

    func checkedUp () -> Bool {
        for i in currentX..<matrix.count {
            if checkedMap[i][currentY] == 0 {
                checkedMap[i][currentY] = 1
                path.append(matrix[i][currentY])
            } else {
                if currentY != matrix[0].count {
                    if checkedMap[i-1][currentY+1] == 0 {
                        return true
                    }
                }
            }
            return false
        }
    }
}