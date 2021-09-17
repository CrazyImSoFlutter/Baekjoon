let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
let dy = [0, 0, -1, 1]
let dx = [-1, 1, 0, 0]
var tomato = Array(repeating: [Int](), count: M)
var visit = Array(repeating: Array(repeating: false, count: N), count: M)
var q = [(Int, Int)]()
var index = 0
var firstTomatoNum = 0
var answer = -1
var flag = true

for i in 0..<M {
    tomato[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    for j in 0..<N {
        if tomato[i][j] == 1 {
            visit[i][j] = true
            q.append((i, j))
            firstTomatoNum += 1
        } else if tomato[i][j] == -1 {
            visit[i][j] = true
        }
    }
}

while index < q.count {
    let size = q.count - index
    answer += 1
    for _ in stride(from: size - 1, through: 0, by: -1) {
        let cur = q[index]
        index += 1
        for j in 0..<4 {
            let qN = cur.0 + dy[j]
            let qM = cur.1 + dx[j]
            if qN < 0 || qN >= M || qM < 0 || qM >= N {
                continue
            }
            if !visit[qN][qM] && tomato[qN][qM] == 0 {
                visit[qN][qM] = true
                q.append((qN, qM))
            }
        }
    }
}

for i in 0..<M {
    for j in 0..<N {
        if !visit[i][j] {
            flag = false
            break
        }
    }
    if !flag {
        break
    }
}

if !flag {
    print(-1)
} else {
    print(answer)
}
