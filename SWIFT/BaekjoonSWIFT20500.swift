let N = Int(readLine()!)!
let MOD = 1000000007
var D = Array(repeating: Array(repeating: 0, count: 3), count: 1516)

D[1][2] = 1
D[1][0] = 0
D[2][0] = 1
D[2][1] = 1
D[2][2] = 0

if N >= 3 {
    for i in 3...N {
        D[i][0] = (D[i - 1][2] + D[i - 1][1]) % MOD
        D[i][1] = (D[i - 1][0] + D[i - 1][2]) % MOD
        D[i][2] = (D[i - 1][1] + D[i - 1][0]) % MOD
    }
}
print(D[N][0])
