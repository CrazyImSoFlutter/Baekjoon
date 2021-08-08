let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0]
let K = NK[1]
var dp = Array(repeating: Array(repeating: 0, count: K + 1), count: N + 1)
var W = [Int]()
var V = [Int]()
var answer = 0

for i in 0..<N {
    let WV = readLine()!.split(separator: " ").map { Int(String($0))! }
    W.append(WV[0])
    V.append(WV[1])
}

for i in 1...N {
    for j in 1...K {
        if W[i - 1] <= j {
            dp[i][j] = max(V[i - 1] + dp[i - 1][j - W[i - 1]], dp[i - 1][j])
            if dp[i][j] > answer {
                answer = dp[i][j]
            }
        } else {
            dp[i][j] = dp[i - 1][j]
            if dp[i][j] > answer {
                answer = dp[i][j]
            }
        }
    }
}

print(answer)
