let A = readLine()!
var stringA = [Character]()
    stringA.insert("0", at: 0)
for i in A {
    stringA.insert(i, at: stringA.count)
}
let B = readLine()!
var stringB = [Character]()
    stringB.insert("0", at: 0)
for i in B {
    stringB.insert(i, at: stringB.count)
}

var dp : [[Int]] = Array(repeating: Array(repeating: 0, count: stringA.count + 1), count: stringB.count + 1)

for j in 1..<stringB.count {
    for i in 1..<stringA.count {
        dp[j][i] = max(dp[j - 1][i], dp[j][i - 1], (dp[j - 1][i - 1] + (stringA[i] == stringB[j] ? 1 : 0 )))
    }
}
print(dp[stringB.count - 1][stringA.count  - 1])
