let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]
var map = Array(repeating: [Character](), count: N)
var visit = Array(repeating: Array(repeating: Array(repeating: false, count: 64), count: M), count: N)
let dy = [0, 0, -1, 1]
let dx = [-1, 1, 0, 0]
var start = (0, 0)

for i in 0..<N {
    map[i] = Array(readLine()!)
    for j in 0..<map[i].count {
        if map[i][j] == "0" {
            start = (i, j)
        }
    }
}

func bfs(_ y: Int, _ x: Int) -> Int {
    var q = [(Int, Int, Int, Int)]()
    var index = 0

    q.append((y, x, 0, 0))
    visit[y][x][0] = true

    while index < q.count {
        let Y = q[index].0
        let X = q[index].1
        let cnt = q[index].2
        let key = q[index].3

        index += 1
        if map[Y][X] == "1" {
            return cnt
        }
        for i in 0..<4 {
            let nextY = Y + dy[i]
            let nextX = X + dx[i]

            if nextY < 0 || nextY >= N || nextX < 0 || nextX >= M || visit[nextY][nextX][key] || map[nextY][nextX] == "#" {
                continue
            }
            if map[nextY][nextX] == "." || map[nextY][nextX] == "0" || map[nextY][nextX] == "1" {
                visit[nextY][nextX][key] = true
                q.append((nextY, nextX, cnt + 1, key))
            } else if map[nextY][nextX].asciiValue! >= 97 && map[nextY][nextX].asciiValue! <= 102 {
                let addKey = key | (1 << (map[nextY][nextX].asciiValue! - 97))

                if !visit[nextY][nextX][addKey] {
                    visit[nextY][nextX][key] = true
                    visit[nextY][nextX][addKey] = true
                    q.append((nextY, nextX, cnt + 1, addKey))
                }
            } else if map[nextY][nextX].asciiValue! >= 65 && map[nextY][nextX].asciiValue! <= 71 {
                if (key & 1 << (map[nextY][nextX].asciiValue! - 65)) != 0 {
                    visit[nextY][nextX][key] = true
                    q.append((nextY, nextX, cnt + 1, key))
                }
            }
        }
    }
    return -1;
}

print(bfs(start.0, start.1))
