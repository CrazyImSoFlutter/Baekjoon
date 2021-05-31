let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
let n = firstLine[0]
let m = firstLine[1]

var maze = [[Int]]()

for _ in 0..<n {
    maze.append(readLine()!.map({Int(String($0))!}))
}

var visited: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var queue: [[Int]] = [[0,0]]

let dx: [Int] = [0,0,-1,1]
let dy: [Int] = [-1,1,0,0]

var predecessor: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [-1, -1], count: m), count: n)
predecessor[0][0] = [0,0]

var distance: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
distance[0][0] = 1

while queue.count != 0 {
    let now = queue.remove(at: 0)
    if visited[now[0]][now[1]] == -1 {
        visited[now[0]][now[1]] = 1
        for i in 0..<dx.count {
            let nowdx = now[0] - dx[i]
            let nowdy = now[1] - dy[i]

            if nowdx < 0 || nowdx > n-1 || nowdy < 0 || nowdy > m-1 {
                continue
            } else {
                if maze[nowdx][nowdy] == 1 && visited[nowdx][nowdy] == -1 {
                predecessor[nowdx][nowdy] = now
                distance[nowdx][nowdy] = distance[now[0]][now[1]] + 1
                queue.append([nowdx, nowdy])
                }
            }
        }
    }
}

print(distance[n-1][m-1])
