let N = Int(readLine()!)!
var W = Array(repeating: Array(repeating: false, count: 100), count: 100)
var WH = Array(repeating: Array(repeating: 0, count: 100), count: 100)
var answer = 0
for _ in 0..<N {
    let B = readLine()!.split(separator: " ").map { Int(String($0))! }

    for i in 0..<10 {
        for j in 0..<10 {
            W[99 - B[1] - i][B[0] + j] = true
        }
    }
}

for i in 0..<100 {
    for j in 0..<100 {
        if W[i][j] && WH[i][j] == 0 {
            var h = 0
            for k in i..<100 {
                if !W[k][j] {
                    break
                }
                h += 1
                WH[k][j] += h
            }
        }
    }
}

for i in 0..<100 {
    for j in 0..<100 {
        if WH[i][j] != 0 {
            var m = WH[i][j]
            var w = 0
            for k in j..<100 {
                if WH[i][k] == 0 {
                    break
                } else {
                    m = min(m, WH[i][k])
                    w += 1
                    answer = max(answer, m * w)
                }
            }
        }
    }
}

print(answer)
