let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 0, count: N + 1)
var max = 1

for i in 0..<N {
    dp[i] = 1
    for j in 0..<i {
        if arr[j] < arr[i] && dp[j] + 1 > dp[i] {
            dp[i] = dp[j] + 1
            if max < dp[i] {
                max = dp[i]
            }
        }
    }
}

print(max)
