let N = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: N)
var answer = 0

for i in 0..<10 {
    dp[0][i] = 1
}

for i in 1..<N {
    for j in 0...9 {
        if j == 0 {
            dp[i][j] = dp[i - 1][j + 1] % 1000000000
        } else if j == 9 {
            dp[i][j] = dp[i - 1][j - 1] % 1000000000
        } else {
            dp[i][j] = dp[i - 1][j - 1] % 1000000000 + dp[i - 1][j + 1] % 1000000000
        }
    }
}

for i in 1...9 {
    answer += dp[N - 1][i]
}

print(answer % 1000000000)
