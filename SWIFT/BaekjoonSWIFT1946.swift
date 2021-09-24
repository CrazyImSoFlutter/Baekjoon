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
var ansStr = ""
for _ in 0..<file.readInt() {
    let N = file.readInt()
    var P = Array(repeating: (0, 0), count: N)
    var answer = 1
    var curMin = 0

    for i in 0..<N {
        P[i] = (file.readInt(), file.readInt())
    }
    P.sort(by: { $0.0 < $1.0 })
    curMin = P[0].1
    for i in 1..<N {
        if P[i].1 < curMin {
            curMin = P[i].1
            answer += 1
        }
    }
    ansStr += "\(answer)\n"
}
print(ansStr)
