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
var answer = ""

for j in 1..<stringB.count {
    for i in 1..<stringA.count {
        dp[j][i] = max(dp[j - 1][i], dp[j][i - 1], (dp[j - 1][i - 1] + (stringA[i] == stringB[j] ? 1 : 0 )))
    }
}

func goBack(_ b: Int, _ a: Int) {
    if b - 1 < 0 || a - 1 < 0 {
        return
    }
    if stringB[b] == stringA[a] {
        answer += String(stringB[b])
        goBack(b - 1, a - 1)
    } else {
        if dp[b][a - 1] > dp[b - 1][a] {
            goBack(b, a - 1)
        } else {
            goBack(b - 1, a)
        }
    }
}

goBack(stringB.count - 1, stringA.count - 1)
print(dp[stringB.count - 1][stringA.count - 1])
if dp[stringB.count - 1][stringA.count - 1] != 0 {
    let reversed = String(answer.reversed())
    print(reversed)
}
