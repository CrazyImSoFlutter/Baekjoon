let N = Int(readLine()!)!
var D = Array(repeating: Array(repeating: 0, count: 10), count: N + 1)
var A = 0
let MOD = 10007

for i in 0..<10 {
    D[1][i] = 1
}

if N > 1 {
    for i in 2...N {
        for j in 0...9 {
            for k in 0...j {
                D[i][j] += D[i - 1][k] % MOD
            }
        }
    }
}

for i in 0...9 {
    A += D[N][i] % MOD
}
print(A % MOD)
