let NKM = readLine()!.split(separator: " ").map { Int(String($0))! }
var N = NKM[0]
var K = NKM[1]
let M = NKM[2]
var dp = Array(repeating: Array(repeating: -1, count: 2001), count: 2001)
var answer = 1

func nCk(_ n: Int, _ k: Int) -> Int {
    if k == 1 {
        return n
    }
    if k == 0 {
        return 1
    }
    if n < k {
        return 0
    }
    if dp[n][k] != -1 {
        return dp[n][k]
    }
    dp[n][k] = (nCk(n - 1, k - 1) + nCk(n - 1, k)) % M
    return dp[n][k]
}

while N != 0 || K != 0 {
    answer *= nCk(N % M, K % M)
    answer %= M
    N /= M
    K /= M
}

print(answer)
