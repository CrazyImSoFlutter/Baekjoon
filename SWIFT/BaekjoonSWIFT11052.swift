let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int(String($0))! }
var DP = Array(repeating: 0, count: N + 1)

A.insert(0, at: 0)
DP[1] = A[1]

if N != 1 {
    for i in 2...N {
        var MAX = 0

        for j in 1...i {
            let tmp = DP[i - j] + A[j]

            if tmp > MAX {
                MAX = tmp
            }
        }
        DP[i] = MAX
    }
}
print(DP[N])
