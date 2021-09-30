import Foundation 

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] 
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } 
        if now == 45{ isPositive.toggle(); now = read() } 
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } 
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

var file = FileIO()
let N = file.readInt()
var P = Array(repeating: Array(repeating: 0, count: N), count: N)
var A = Array(repeating: 0, count: 3)
for i in 0..<N {
    for j in 0..<N {
        P[i][j] = file.readInt()
    }
}

func check(_ minY: Int, _ minX: Int, _ maxY: Int, _ maxX: Int) -> Bool {
    for i in minY..<maxY {
        for j in minX..<maxX {
            if P[i][j] != P[minY][minX] {
                return false
            }
        }
    }
    return true
}

func pick(_ minY: Int, _ minX: Int, _ maxY: Int, _ maxX: Int) {
    if check(minY, minX, maxY, maxX) {
        if P[minY][minX] == -1 {
            A[0] += 1
        } else if P[minY][minX] == 0 {
            A[1] += 1
        } else {
            A[2] += 1
        }
    } else {
        let y1 = minY, y2 = maxY
        let x1 = minX, x2 = maxX
        let dy = (maxY - minY) / 3, dx = (maxX - minX) / 3

        pick(y1, x1, y2 - 2 * dy, x2 - 2 * dx)
        pick(y1, x1 + dx, y2 - 2 * dy, x2 - dx)
        pick(y1, x1 + 2 * dx, y2 - 2 * dy, x2)

        pick(y1 + dy, x1, y2 - dy, x2 - 2 * dx)
        pick(y1 + dy, x1 + dx, y2 - dy, x2 - dx)
        pick(y1 + dy, x1 + 2 * dx, y2 - dy, x2)

        pick(y1 + 2 * dy, x1, y2, x2 - 2 * dx)
        pick(y1 + 2 * dy, x1 + dx, y2, x2 - dx)
        pick(y1 + 2 * dy, x1 + 2 * dx, y2, x2)
    }
}

pick(0, 0, N, N)

print(A[0])
print(A[1])
print(A[2])
