let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]
var map = Array(repeating: [Int](), count: N)
var blank = [(Int, Int)]()
var virusq = [(Int, Int)]()
var arr = Array(repeating: 0, count: 3)
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]
var answer = 0

for i in 0..<N {
    map[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0..<M {
        if map[i][j] == 0 {
            blank.append((i, j))
        } else if map[i][j] == 2 {
            virusq.append((i, j))
        }
    }
}

var dfsVisit = Array(repeating: false, count: blank.count)

func BFS(_ array: [Int]) -> Int {
    var tmpMap = map
    var tmpVirusq = virusq
    var index = 0
    var safeArea = 0
    for i in array {
        let tmp = blank[i]
        tmpMap[tmp.0][tmp.1] = 1
    }
    while index < tmpVirusq.count {
        let cur = tmpVirusq[index]
        tmpMap[cur.0][cur.1] = 2
        index += 1
        for i in 0..<4 {
            if cur.0 + dy[i] < 0 || cur.0 + dy[i] >= N || cur.1 + dx[i] < 0 || cur.1 + dx[i] >= M {
                continue
            }
            if tmpMap[cur.0 + dy[i]][cur.1 + dx[i]] == 0 {
                tmpVirusq.append((cur.0 + dy[i], cur.1 + dx[i]))
            }
        }
    }
    for i in 0..<N {
        for j in 0..<M {
            if tmpMap[i][j] == 0 {
                safeArea += 1
            }
        }
    }
    return safeArea
}

func DFS(_ n: Int, _ m: Int, _ depth: Int) {
    if depth == m {
        answer = max(BFS(arr), answer)
        return
    }
    
    for i in 0..<n {
        if dfsVisit[i] == false {
            dfsVisit[i] = true
            if depth != 0 {
                if arr[depth - 1] < i {
                    arr[depth] = i
                    DFS(n, m, depth + 1)
                }
            } else {
                arr[depth] = i
                DFS(n, m, depth + 1)
            }
            dfsVisit[i] = false
        }
    }
}

DFS(blank.count, 3, 0)

print(answer)
