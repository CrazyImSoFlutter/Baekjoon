let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]
var map = Array(repeating: [Int](), count: N)
var index = 0
let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

for i in 0..<N {
    map[i] = readLine()!.map{ Int(String($0))! }
}

func bfs() -> Int {
    var q = [(Int, Int, Int)]()
    q.append((0, 0, 1))
    var visit = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: M), count: N)
    visit[0][0][1] = 1
    while q.count > index {
        var cur = q[index]
        if cur.0 == N - 1 && cur.1 == M - 1 {
            return visit[cur.0][cur.1][cur.2]
        }
        for i in 0..<4 {
            let curX = cur.1 + dx[i]
            let curY = cur.0 + dy[i]
            if !(curX < 0 || curX >= M || curY < 0 || curY >= N) {
                if map[curY][curX] == 1 && cur.2 == 1 {
                    visit[curY][curX][0] = visit[cur.0][cur.1][1] + 1
                    q.append((curY, curX, 0))
                } else if map[curY][curX] == 0 && visit[curY][curX][cur.2] == 0 {
                    visit[curY][curX][cur.2] = visit[cur.0][cur.1][cur.2] + 1
                    q.append((curY, curX, cur.2))
                }
            }
        }
        index += 1
    }
    return -1
}

print(bfs())
