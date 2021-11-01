let N = Int(readLine()!)!
var A = Array(repeating: [Int](), count: N)
var B = 0
var W = 0

for i in 0..<N {
    A[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

binary(0, 0, N, N)

print(W)
print(B)

func check(_ minY: Int, _ minX: Int, _ maxY: Int, _ maxX: Int) -> Bool {
    for i in minY..<maxY {
        for j in minX..<maxX {
            if A[i][j] != A[minY][minX] {
                return false
            }
        }
    }
    if A[minY][minX] == 1 {
        B += 1
    } else {
        W += 1
    }
    return true
}

func binary(_ minY: Int, _ minX: Int, _ maxY: Int, _ maxX: Int) {
    let dy = (maxY - minY) / 2
    let dx = (maxX - minX) / 2

    if !check(minY, minX, maxY, maxX) {
        binary(minY, minX, maxY - dy, maxX - dx)
        binary(minY + dy, minX + dx, maxY, maxX)
        binary(minY + dy, minX, maxY, maxX - dx)
        binary(minY, minX + dx, maxY - dy, maxX)
    }
}
