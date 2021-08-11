var dp = Array(repeating: Array(repeating: 0, count: 3), count: 100001)
var ex = Array(repeating: 0, count: 100001)
let mod = 20150523

func lessthanX(_ num : [Int]) -> Int {
    var ret = -1
    var n = num.count
    var cur = 0
    for i in 0..<n {
        var top = num[i]
        for j in 0..<top {
            if (j != 0) && (j % 3 == 0) { continue }
            var temp = (cur + j) % 3
            ret += dp[n - i - 1][(3 - temp) % 3]
            ret %= mod
        }
        if (top != 0) && (top % 3 == 0) { break }
        cur = (cur + top) % 3
    }
    var ex3 = 0
    for i in 0..<n {
        var top = num[i]
        for j in 0..<top {
            if (j != 0) && (j % 3 == 0) { continue }
            ex3 += ex[n - i - 1]
            ex3 %= mod
        }
        if (top != 0) && (top % 3 == 0) {break}
    }

    var pow = 1
    var all = 0

    for i in stride(from: n - 1, through: 0, by: -1) {
        all += num[i] * pow
        all %= mod
        pow = (pow * 10) % mod
    }
    all -= ex3
    all %= mod
    if all < 0 { all += mod }
    return (all + ret) % mod
}

func isclap(_ num: [Int]) -> Bool {
    var sum = 0
    var n = num.count
    for i in 0..<n {
        sum += num[i]
        if (num[i] != 0) && (num[i] % 3 == 0) { return true }
    }
    return sum % 3 == 0
}

let AB = readLine()!.split(separator: " ")
var A = [Int](); for i in AB[0] { A.append(Int(String(i))!) }
var B = [Int](); for i in AB[1] { B.append(Int(String(i))!) }

dp[0][0] = 1
dp[1][0] = 1
dp[1][1] = 3
dp[1][2] = 3
ex[0] = 1
ex[1] = 7

for i in 2...100000 {
    dp[i][0] = (dp[i - 1][2] * 3 + dp[i - 1][1] * 3 + dp[i - 1][0]) % mod
    dp[i][1] = (dp[i - 1][2] * 3 + dp[i - 1][0] * 3 + dp[i - 1][1]) % mod
    dp[i][2] = (dp[i - 1][1] * 3 + dp[i - 1][0] * 3 + dp[i - 1][2]) % mod
    ex[i] = (ex[i - 1] * 7) % mod
}

var ans = lessthanX(B) - lessthanX(A) + (isclap(B) ? 1 : 0)
ans %= mod
if ans < 0 { ans += mod}
print(ans)

