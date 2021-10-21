let N = Int(readLine()!)!
var C = [(Int, Int)]()
var D = Array(repeating: 0, count: N + 1)
var A = 0

for _ in 0..<N {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }

    C.append((tmp[0], tmp[1]))
}

for i in 1..<N + 1 {
    var MAX = 0
    for j in 0..<i {
        if j + C[j].0 - 1 < i {
            MAX = max(MAX, D[j] + C[j].1)
        }
    }
    D[i] = MAX
    A = max(A, MAX)
}

print(A)
