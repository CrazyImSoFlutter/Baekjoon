let n = Int(readLine()!)!
var arr = [Int]()
var dp = [Int]()
var A = 0

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

dp.append(arr[0])
if n > 1 {
    dp.append(arr[0] + arr[1])
}
if n > 2 {
    dp.append(max(max(dp[0] + arr[2], dp[0] + arr[1]), arr[1] + arr[2]))
}
if n > 3 {
    for i in 3..<n {
        let n1 = dp[i - 1]
        let n2 = dp[i - 2] + arr[i]
        let n3 = dp[i - 3] + arr[i] + arr[i - 1]
        dp.append(max(max(n1, n2), n3))
    }
}
print(dp[n - 1])
