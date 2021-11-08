let N = Int(readLine()!)!
var M = Array(repeating: [Int](), count: N)
var V = Array(repeating: Array(repeating: false, count: N), count: N)
var A = [Int]()
let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

for i in 0..<N {
    M[i] = readLine()!.map { Int(String($0))! }
}

for i in 0..<N {
    for j in 0..<N {
        if M[i][j] == 1 && V[i][j] == false {
            BFS((i, j))
        }
    }
}

print(A.count)
A.sort()
for i in 0..<A.count {
    print(A[i])
}

func BFS(_ s: (Int, Int)) {
    var Q = [(Int, Int)]()
    var I = 0

    Q.append(s)
    V[s.0][s.1] = true
    while I < Q.count {
        let cur = Q[I]

        I += 1
        for i in 0..<4 {
            let y = cur.0 + dy[i]
            let x = cur.1 + dx[i]

            if y < 0 || y >= N || x < 0 || x >= N {
                continue
            } else if M[y][x] == 1 && V[y][x] == false {
                Q.append((y, x))
                V[y][x] = true
            }
        }
    }
    A.append(Q.count)
}
