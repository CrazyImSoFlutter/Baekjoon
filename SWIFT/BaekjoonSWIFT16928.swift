let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]
var distance = Array(repeating: -1, count: 101)
var board = Array(repeating: 0, count: 101)
var queue = [Int]()
var index = 0

for i in 1...100 {
    board[i] = i
}

for _ in 0..<N {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    let x = xy[0], y = xy[1]
    
    board[x] = y
}

for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let u = uv[0], v = uv[1]
    
    board[u] = v
}

distance[1] = 0
queue.append(1)

while index < queue.count {
    let cur = queue[index]
    
    index += 1
    for i in 1...6 {
        var nextMove = cur + i
        
        if nextMove > 100 {
            break
        }
        nextMove = board[nextMove]
        if distance[nextMove] == -1 {
            distance[nextMove] = distance[cur] + 1
            queue.append(nextMove)
        }
    }
}

print(distance[100])
