var A = readLine()!
var B = readLine()!
var stringA = [Character]()
var stringB = [Character]()

for i in A {
    stringA.append(i)
}
for i in B {
    stringB.append(i)
}
stringA.insert("0", at: 0)
stringB.insert("0", at: 0)
var dp = Array(repeating: Array(repeating: 0, count: stringA.count), count: stringB.count)

for j in 1..<stringB.count {
    for i in 1..<stringA.count {

        dp[j][i] = max(dp[j - 1][i], dp[j][i - 1], (dp[j - 1][i - 1] + (stringA[i] == stringB[j] ? 1 : 0 )))
    }
}
print(dp[stringB.count - 1][stringA.count  - 1])
