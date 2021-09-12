let N = Int(readLine()!)!
let MAX = 9999999
var RGB = Array(repeating: Array(repeating: 0, count: 3), count: N)
var d = Array(repeating: Array(repeating: 0, count: 3), count: N)
var flag = Array(repeating: -1, count: 3)
var answer = MAX

for i in 0..<N {
    let h = readLine()!.split(separator: " ").map { Int(String($0))! }
    RGB[i][0] = h[0]; RGB[i][1] = h[1]; RGB[i][2] = h[2]
}

for j in 0..<3 {
    for i in 0..<3 {
        if j == i {
            d[0][i] = RGB[0][i]
        } else {
            d[0][i] = MAX
        }
    }
    for i in 1..<N {
        d[i][0] = min(d[i - 1][1], d[i - 1][2]) + RGB[i][0]
        d[i][1] = min(d[i - 1][0], d[i - 1][2]) + RGB[i][1]
        d[i][2] = min(d[i - 1][0], d[i - 1][1]) + RGB[i][2]
    }
    for i in 0..<3 {
        if j != i {
            answer = min(answer, d[N - 1][i])
        }
    }
}
print(answer)

