let N = Int(readLine()!)!
var tri = Array(repeating: [Int](), count: N)


for i in 0..<N {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    tri[i] = tmp
}

for i in 1..<N {
    for j in 0..<i + 1 {
        if j == 0 {
            tri[i][0] = tri[i - 1][0] + tri[i][0]
        } else if j == i {
            tri[i][i] = tri[i - 1][i - 1] + tri[i][i]
        } else {
            tri[i][j] = max(tri[i - 1][j - 1], tri[i - 1][j]) + tri[i][j]
        }
    }
}

print(tri[N - 1].max()!)
