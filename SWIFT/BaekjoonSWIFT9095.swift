for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: 12)

    dp[1][0] = 1
    dp[2][0] = 1
    dp[3][0] = 2
    dp[2][1] = 1
    dp[3][1] = 1
    dp[3][2] = 1
    
    if n > 3 {
        for i in 4...n {
            dp[i][0] = dp[i - 1][0] + dp[i - 1][1] + dp[i - 1][2]
            dp[i][1] = dp[i - 2][0] + dp[i - 2][1] + dp[i - 2][2]
            dp[i][2] = dp[i - 3][0] + dp[i - 3][1] + dp[i - 3][2]
        }
    }

    print(dp[n][0] + dp[n][1] + dp[n][2])
}
