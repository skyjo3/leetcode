class Solution {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var location = (0, 0)
        var direction = (0, 1) // north
        var maxVal = 0

        for i in 0 ..< commands.count {
            if commands[i] < 0 {
                direction = changeDirection(from: direction, to: commands[i])
            } else {
                location = getLocationAfterMoving(commands[i], from: location, in: direction, with: obstacles)
            }
            maxVal = max(maxVal, getDistanceBetweenOrigin(and: location))
        }
        return maxVal
    }
    let directions = [
        (0,1), // N
        (1,0), // E
        (0,-1), // S
        (-1,0) // W
    ]
    func changeDirection(from currentDirection: (Int, Int), to turn: Int) -> (Int, Int) {
        var index = directions.firstIndex { direction in
            direction.0 == currentDirection.0 && direction.1 == currentDirection.1
        }
        guard var index = index else { return (0, 1) }
        if turn == -1 {
            index = (index+1) % 4
        } else if turn == -2 {
            index = (index-1) < 0 ? 3 : (index-1)
        }
        return directions[index]
    } 
    func getLocationAfterMoving(_ distance: Int, from location: (Int, Int), in direction: (Int, Int), with obstacles: [[Int]]) -> (Int, Int) {
        var destination = (location.0 + direction.0 * distance, location.1 + direction.1 * distance)
        var firstObstacle : (Int, Int) = (destination.0 + direction.0, destination.1 + direction.1)
        
        for obstacle in obstacles {
            if obstacle[0] == location.0 && obstacle[1] == location.1 {
                continue
            }
            else if direction == (0, 1) || direction == (0, -1) {
                if location.0 == obstacle[0] &&
                min(location.1, destination.1) <= obstacle[1] && 
                obstacle[1] <= max(location.1, destination.1) && 
                abs(firstObstacle.1 - location.1) >= abs(obstacle[1] - location.1) {
                    firstObstacle = (obstacle[0], obstacle[1])
                }
            } else if direction == (1, 0) || direction == (-1, 0) {
                if location.1 == obstacle[1] &&
                min(location.0, destination.0) <= obstacle[0] && 
                obstacle[0] <= max(location.0, destination.0) &&
                abs(firstObstacle.0 - location.0) >= abs(obstacle[0] - location.0) {
                    firstObstacle = (obstacle[0], obstacle[1])
                }
            }
        }
        destination = (firstObstacle.0 - direction.0, firstObstacle.1 - direction.1)
        return destination
    }
    func getDistanceBetweenOrigin(and location: (Int, Int)) -> Int {
        return location.0*location.0 + location.1*location.1
    }
}