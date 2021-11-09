let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0], K = NK[1]
var V = Array(repeating: false, count: 100001)
var Q = [(Int, Int)]()
var I = 0

Q.append((N, 0))
V[N] = true

while I < Q.count {
    let C = Q[I]

    I += 1
    if C.0 == K {
        print(C.1)
        break
    }
    if C.0 + 1 >= 0 && C.0 + 1 <= 100000 && V[C.0 + 1] == false {
        Q.append((C.0 + 1, C.1 + 1))
        V[C.0 + 1] = true
    }
    if C.0 - 1 >= 0 && C.0 - 1 <= 100000 && V[C.0 - 1] == false {
        Q.append((C.0 - 1, C.1 + 1))
        V[C.0 - 1] = true
    }
    if C.0 * 2 >= 0 && C.0 * 2 <= 100000 && V[C.0 * 2] == false {
        Q.append((C.0 * 2, C.1 + 1))
        V[C.0 * 2] = true
    }
}
