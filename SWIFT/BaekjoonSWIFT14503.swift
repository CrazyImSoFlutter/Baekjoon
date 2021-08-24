let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]
let rcd = readLine()!.split(separator: " ").map { Int(String($0))! }
var r = rcd[0], c = rcd[1], d = rcd[2]
var map = Array(repeating: [Int](), count: N)
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]
var answer = 0
for i in 0..<N {
    map[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func clean(_ r: Int, _ c: Int, _ d: Int) {
    var y = r, x = c
    var direction = d
    var canClean = false
    if map[y][x] != 2 {
        map[y][x] = 2
        answer += 1
    }
    for _ in 0..<4 {
        direction = (direction - 1 + 4) % 4
        if map[y + dy[direction]][x + dx[direction]] == 0 {
            y += dy[direction]
            x += dx[direction]
            canClean = true
            break
        }
    }
    if canClean {
        clean(y, x, direction)
    } else {
        if map[y + dy[(direction + 2) % 4]][x + dx[(direction + 2) % 4]] != 1 {
            clean(y + dy[(direction + 2) % 4], x + dx[(direction + 2) % 4], direction)
        } else {
            return
        }
    }
}

clean(r, c, d)
print(answer)
