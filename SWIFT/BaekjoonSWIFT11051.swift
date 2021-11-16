let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0], K = NK[1]
let MOD = 10007
var D = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)

for i in 1...N {
    D[i][0] = 1
    D[i][i] = 1
}

print(get(N, K))

func get(_ n: Int, _ k: Int) -> Int {
    if D[n][k] != 0 {
        return D[n][k]
    } else {
        let left = get(n - 1, k - 1) % MOD
        let right = get(n - 1, k) % MOD

        D[n][k] = (left + right) % MOD
        return D[n][k]
    }
}
