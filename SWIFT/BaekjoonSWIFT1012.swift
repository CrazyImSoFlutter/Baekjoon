let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

func bfs(_ map: [[Int]], _ visit: inout [[Bool]], _ cabbageQ: inout [(Int, Int)], _ location: (Int, Int), _ answer: inout Int) {
    var index = 0
    if visit[location.0][location.1] {
        return
    }
    visit[location.0][location.1] = true
    cabbageQ.append(location) 
    while index < cabbageQ.count {
        let tmp = cabbageQ[index]
        for i in 0..<4 {
            if tmp.0 + dy[i] < 0 || tmp.0 + dy[i] >= map.count || tmp.1 + dx[i] < 0 || tmp.1 + dx[i] >= map[0].count {
                continue
            }
            if visit[tmp.0 + dy[i]][tmp.1 + dx[i]] {
                continue
            }
            if map[tmp.0 + dy[i]][tmp.1 + dx[i]] == 1 {
                cabbageQ.append((tmp.0 + dy[i], tmp.1 + dx[i]))
                visit[tmp.0 + dy[i]][tmp.1 + dx[i]] = true
            }
        }
        index += 1
    }
    cabbageQ = [(Int, Int)]()
    answer += 1
}

let T = Int(readLine()!)!

for _ in 0..<T {
    let NMK = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = NMK[0], M = NMK[1], K = NMK[2]
    var farm = Array(repeating: Array(repeating: 0, count: M), count: N)
    var visit = Array(repeating: Array(repeating: false, count: M), count: N)
    var cabbage = [(Int, Int)]()
    var cabbageQ = [(Int, Int)]()
    var answer = 0
    for i in 0..<K {
        let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
        cabbage.append((tmp[0], tmp[1]))
        farm[tmp[0]][tmp[1]] = 1
    }

    for i in cabbage {
        bfs(farm, &visit, &cabbageQ, i, &answer)
    }
    print(answer)
}

