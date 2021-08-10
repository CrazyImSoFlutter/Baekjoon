let N = Int(readLine()!)!
var RGB = Array(repeating: Array(repeating: 0, count: 3), count: N)
var d = Array(repeating: Array(repeating: 0, count: 3), count: N)

for i in 0..<N {
    let h = readLine()!.split(separator: " ").map { Int(String($0))! }
    RGB[i][0] = h[0]; RGB[i][1] = h[1]; RGB[i][2] = h[2]
}

d[0][0] = RGB[0][0]
d[0][1] = RGB[0][1]
d[0][2] = RGB[0][2]

for i in 1..<N {
    d[i][0] = min(d[i - 1][1], d[i - 1][2]) + RGB[i][0]
    d[i][1] = min(d[i - 1][0], d[i - 1][2]) + RGB[i][1]
    d[i][2] = min(d[i - 1][0], d[i - 1][1]) + RGB[i][2]
}

print(min(min(d[N - 1][0], d[N - 1][1]), d[N - 1][2]))
