let N = Int(readLine()!)!
var pc = [(Int, Int)]()
var dp = Array(repeating: 0, count: N)

for _ in 0..<N {
    var line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    pc.append((line[0], line[1]))
}
pc.sort(by: { $0 < $1 })

for i in 0..<N {
    dp[i] = 1
    for j in 0..<i {
        if pc[j].1 < pc[i].1 && dp[j] + 1 > dp[i] {
            dp[i] = dp[j] + 1
        }
    }
}
print(N - dp.max()!)
