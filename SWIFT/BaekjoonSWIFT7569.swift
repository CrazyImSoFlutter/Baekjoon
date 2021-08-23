import Foundation

let MNH = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = MNH[0], N = MNH[1], H = MNH[2]
let dx = [-1, 1, 0, 0, 0, 0]
let dy = [0, 0, 0, 0, -1, 1]
let dz = [0, 0, -1, 1, 0, 0]
var box = Array(repeating: Array(repeating: Array(repeating: 0, count: H), count: M), count: N)
var visit = Array(repeating: Array(repeating: Array(repeating: false, count: H), count: M), count: N)
var BFSq = [(Int, Int, Int)]()
var answer = -1
var index = 0
for i in 0..<H {
    for j in 0..<N {
        let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
        for k in 0..<M {
            box[j][k][i] = tmp[k]
            if box[j][k][i] == 1 {
                visit[j][k][i] = true
                BFSq.append((j, k, i))
            } else if box[j][k][i] == -1 {
                visit[j][k][i] = true
            }
        }
    }
}

while index < BFSq.count {
    let size = BFSq.count - index
    answer += 1
    for _ in stride(from: size - 1, through: 0, by: -1) {
        let cur = BFSq[index]
        index += 1
        for j in 0..<6 {
            let qN = cur.0 + dy[j]
            let qM = cur.1 + dx[j]
            let qH = cur.2 + dz[j]
            if qN < 0 || qN >= N || qM < 0 || qM >= M || qH < 0 || qH >= H {
                continue
            }

            if visit[qN][qM][qH] == false && box[qN][qM][qH] == 0 {
                visit[qN][qM][qH] = true
                BFSq.append((qN, qM, qH))
            }
        }
    }
}

for i in 0..<N {
    for j in 0..<M {
        for k in 0..<H {
            if visit[i][j][k] == false {
                print(-1)
                exit(0)
            }
        }
    }
}
print(answer)
