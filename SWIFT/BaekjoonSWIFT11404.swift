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
let n = file.readInt()
let m = file.readInt()
let INF = 100000000
var city = Array(repeating: Array(repeating: INF, count: n), count: n)
for _ in 0..<m {
    let start = file.readInt() - 1
    let end = file.readInt() - 1
    let cost = file.readInt()
    city[start][end] = min(cost, city[start][end])
}

for i in 0..<n {
    for j in 0..<n {
        for k in 0..<n {
            city[j][k] = min(city[j][i] + city[i][k], city[j][k])
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if i == j || city[i][j] == INF {
            city[i][j] = 0
        }
    }
}

for i in 0..<n {
    print(city[i].map { String($0) }.joined(separator: " "))
}
