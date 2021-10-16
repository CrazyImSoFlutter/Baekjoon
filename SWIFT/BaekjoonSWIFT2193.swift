let N = Int(readLine()!)!
var A = Array(repeating: Array(repeating: 0, count: 2), count: 91)

A[1][0] = 0
A[1][1] = 1
A[2][0] = 1
A[2][1] = 0

if N > 2 {
    for i in 3...N {
        A[i][0] = A[i - 1][0] + A[i - 1][1]
        A[i][1] = A[i - 1][0]
    }
}
print(A[N][0] + A[N][1])

