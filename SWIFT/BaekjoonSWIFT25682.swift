let NMK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NMK[0], M = NMK[1], K = NMK[2]
var chess = Array(repeating: [String](), count: N)
var prefixSumWB = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
var prefixSumBW = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
var answer = 4000001

for i in 0..<N {
    chess[i] = readLine()!.map { String($0) }
}

for i in 0..<N {
    for j in 0..<M {
        if ((i + j) % 2 == 0 && chess[i][j] == "W") || ((i + j) % 2 == 1 && chess[i][j] != "W") {
            prefixSumBW[i + 1][j + 1] = prefixSumBW[i][j + 1] + prefixSumBW[i + 1][j] - prefixSumBW[i][j] + 1
        } else {
            prefixSumBW[i + 1][j + 1] = prefixSumBW[i][j + 1] + prefixSumBW[i + 1][j] - prefixSumBW[i][j]
        }
        if ((i + j) % 2 == 0 && chess[i][j] == "B") || ((i + j) % 2 == 1 && chess[i][j] != "B") {
            prefixSumWB[i + 1][j + 1] = prefixSumWB[i][j + 1] + prefixSumWB[i + 1][j] - prefixSumWB[i][j] + 1
        } else {
            prefixSumWB[i + 1][j + 1] = prefixSumWB[i][j + 1] + prefixSumWB[i + 1][j] - prefixSumWB[i][j]
        }
    }
}

for i in 1...N-K + 1 {
    for j in 1...M-K + 1 {
        let recolorTileBW = prefixSumBW[i + K - 1][j + K - 1] - prefixSumBW[i + K - 1][j - 1] - prefixSumBW[i - 1][j + K - 1] + prefixSumBW[i - 1][j - 1]
        let recolorTileWB = prefixSumWB[i + K - 1][j + K - 1] - prefixSumWB[i + K - 1][j - 1] - prefixSumWB[i - 1][j + K - 1] + prefixSumWB[i - 1][j - 1]
        
        answer = answer < recolorTileBW ? answer : recolorTileBW
        answer = answer < recolorTileWB ? answer : recolorTileWB
    }
}

print(answer)
