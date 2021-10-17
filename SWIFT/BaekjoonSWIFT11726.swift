let N = Int(readLine()!)!
var A = Array(repeating: Array(repeating: 0, count: 2), count: 1001)
let MOD = 10007

A[1][0] = 1
A[2][0] = 1
A[2][1] = 1

if N > 2 {
    for i in 3...N {
        A[i][0] = (A[i - 1][0] + A[i - 1][1]) % MOD
        A[i][1] = (A[i - 2][0] + A[i - 2][1]) % MOD
    }
}

print((A[N][0] + A[N][1]) % MOD)
