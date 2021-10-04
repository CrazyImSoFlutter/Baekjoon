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
var b = Array(repeating: [Int](), count: n + 1)
var c = Array(repeating: 0, count: n + 1)

for i in 1...n {
    let tmp = file.readInt()
    if i == 1 {
        continue
    }
    b[tmp].append(i)
}
for _ in 0..<m {
    let i = file.readInt()
    let w = file.readInt()
    c[i] += w
}

func dfs(_ cur: Int) {
    for i in 0..<b[cur].count {
        c[b[cur][i]] += c[cur]
        dfs(b[cur][i])
    }
}

dfs(1)

print(c[1...n].map { String($0) }.joined(separator: " "))
