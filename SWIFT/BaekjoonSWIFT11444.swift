var n = UInt64(readLine()!)!
let mod : UInt64 = 1000000007

func multiply(_ a: [[UInt64]], _ b: [[UInt64]]) -> [[UInt64]] {
    var fibo : [[UInt64]] = Array(repeating: Array(repeating: 0, count: 2), count: 2)
    
    for i in 0..<2 {
        for j in 0..<2 {
            for k in 0..<2 {
                fibo[i][j] += a[i][k] * b[k][j]
            }
            fibo[i][j] %= mod
        }
    }
    return fibo
}

var answer : [[UInt64]] = [[1, 0], [0, 1]]
var a : [[UInt64]] = [[1, 1], [1, 0]]

while n > 0 {
    if n % 2 == 1 {
        answer = multiply(answer, a)
    }
    a = multiply(a, a)
    n /= 2
}

print(answer[0][1])
