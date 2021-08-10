var dp = Array(repeating: Array(repeating: Array(repeating: 0, count : 20), count: 20), count: 20)

dp[0][0][0] = 2

func w(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a <= 0 || b <= 0 || c <= 0 {
        return 1
    } else if a > 20 || b > 20 || c > 20 {
        return w(20, 20, 20)
    } else if dp[a - 1][b - 1][c - 1] != 0 {
        return dp[a - 1][b - 1][c - 1]
    } else {
        if a < b, b < c {
            dp[a - 1][b - 1][c - 1] = w(a, b, c - 1) + w(a, b - 1, c - 1) - w(a, b - 1, c)
            return dp[a - 1][b - 1][c - 1]
        } else {
            dp[a - 1][b - 1][c - 1] = w(a - 1, b, c) + w(a - 1, b - 1, c) + w(a - 1, b, c - 1) - w(a - 1, b - 1, c - 1)
            return dp[a - 1][b - 1][c - 1]
        }
    }
}
while true {
    let ABC = readLine()!.split(separator: " ").map { Int(String($0))! }
    let A = ABC[0]; let B = ABC[1]; let C = ABC[2];
    if A == -1, B == -1, C == -1 {
        break
    }
    print("w(\(A), \(B), \(C)) = \(w(A, B, C))")
}
