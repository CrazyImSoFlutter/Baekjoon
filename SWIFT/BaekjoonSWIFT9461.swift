let T = Int(readLine()!)!
var TArr = [Int]()
var dp  = [1, 1, 1, 2, 2, 3, 4, 5, 7, 9]
var bigCase = 0

for _ in 0..<T {
    TArr.append(Int(readLine()!)!)
}

bigCase = TArr.max()!

func padovan(_ x: Int) -> Int {
    if dp[x - 1] != 0 {
        return dp[x - 1]
    } else {
        dp[x - 1] = padovan(x - 3) + padovan(x - 2)
        return dp[x - 1]
    }
}

if dp.count < bigCase {
    for _ in 0..<bigCase - dp.count {
        dp.append(0)
    }
    for i in TArr {
        print(padovan(i))
    }
} else {
    for i in TArr {
        print(dp[i - 1])
    }
}
