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
let M = file.readInt()
let N = file.readInt()
var A = Array(repeating: Array(repeating: 0, count: N), count: M)
var D = Array(repeating: Array(repeating: -1, count: N), count: M)
var dy = [0, 0, 1, -1]
var dx = [1, -1, 0, 0]

for i in 0..<M {
    for j in 0..<N {
        A[i][j] = file.readInt()
    }
}

print(dfs(0, 0))

func dfs(_ y: Int, _ x: Int) -> Int {
    
    if y == (M - 1) && x == (N - 1) {
        return 1
    }
    if D[y][x] == -1 {
        D[y][x] = 0
        for i in 0..<4 {
            let Y = y + dy[i]
            let X = x + dx[i]

            if Y < 0 || Y >= M || X < 0 || X >= N {
                continue
            } else if A[y][x] > A[Y][X] {
                D[y][x] += dfs(Y, X)
            }
        }
    }
    return D[y][x]
}
