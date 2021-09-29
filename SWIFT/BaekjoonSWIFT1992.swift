let N = Int(readLine()!)!
var M = Array(repeating: [String](), count: N)
var A = ""
for i in 0..<N {
    M[i] = readLine()!.map { String($0) }
}

func check(_ minY: Int, _ minX: Int, _ maxY: Int, _ maxX: Int) -> Bool {
    for i in minY..<maxY {
        for j in minX..<maxX {
            if M[minY][minX] != M[i][j] {
                return false
            }
        }
    }
    return true
}

func find(_ minY: Int, _ minX: Int, _ maxY: Int, _ maxX: Int) {
    if check(minY, minX, maxY, maxX) {
        A += M[minY][minX]
    } else {
        A += "("
        find(minY, minX, maxY - (maxY - minY) / 2, maxX - (maxX - minX) / 2)
        find(minY, minX + (maxX - minX) / 2, maxY - (maxY - minY) / 2, maxX)
        find(minY + (maxY - minY) / 2, minX, maxY, maxX - (maxX - minX) / 2)
        find(minY + (maxY - minY) / 2, minX + (maxX - minX) / 2, maxY, maxX)
        A += ")"
    }
}

find(0, 0, N, N)
print(A)
