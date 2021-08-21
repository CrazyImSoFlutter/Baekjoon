let N = Int(readLine()!)!
let K = Int(readLine()!)!
var apple = [(Int, Int)]()
for _ in 0..<K {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    apple.append((tmp[0] - 1, tmp[1] - 1))
}
let L = Int(readLine()!)!
var snakeDirection = [(Int, String)]()
for _ in 0..<L {
    let tmp = readLine()!.split(separator: " ")
    snakeDirection.append((Int(String(tmp[0]))!, String(tmp[1])))
}
var map = Array(repeating: Array(repeating: 0, count: N), count: N)
var direction = (0, 1)
var snake = Array(repeating: (0, 0), count: 1)
var snakeHeadY = 0
var snakeHeadX = 0
var second = 0
var endFlag = false

func turn(_ command: String) {
    let tmp = direction
    if command == "L" {
        direction.0 = 0 * tmp.0 - 1 * tmp.1
        direction.1 = 1 * tmp.0 + 0 * tmp.1
    } else if command == "D" {
        direction.0 = 0 * tmp.0 + 1 * tmp.1
        direction.1 = -1 * tmp.0 - 0 * tmp.1
    }
}

func gameOver(_ head: (Int, Int)) -> Bool {
    if snake.contains(where: { $0 == head }) {
        return true
    }
    if head.0 < 0 || head.0 >= N || head.1 < 0 || head.1 >= N {
        return true
    }
    return false
}

func isApple(_ head: (Int, Int)) -> Bool {
    if apple.contains(where: { $0 == head }) {
        apple.removeAll(where: { $0 == head })
        return true
    }
    return false
}

func move() {
    second += 1
    snakeHeadY += 1 * direction.0
    snakeHeadX += 1 * direction.1
    if gameOver((snakeHeadY, snakeHeadX)) {
        endFlag = true
    }
    if isApple((snakeHeadY, snakeHeadX)) {
        snake.append((snakeHeadY, snakeHeadX))
    } else {
        snake.append((snakeHeadY, snakeHeadX))
        snake.removeFirst()
    }
}

while true {
    move()
    if endFlag == true {
        break
    }
    if snakeDirection.contains(where: { $0.0 == second }) {
        turn(snakeDirection[snakeDirection.firstIndex(where: { $0.0 == second })!].1)
    }
}

print(second)
