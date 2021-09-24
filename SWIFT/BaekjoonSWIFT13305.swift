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
var road = Array(repeating: 0, count: N - 1)
var oil = Array(repeating: 0, count: N)
var answer : UInt64 = 0
for i in 0..<N - 1 {
    road[i] = file.readInt()
}
for i in 0..<N {
    oil[i] = file.readInt()
}

var index = 0
while index < N - 1 {
    var cur = oil[index]
    var roadSum = 0

    while true {
        index += 1
        if index >= N {
            answer += UInt64(roadSum * cur)
            break
        }
        if cur >= oil[index] {
            roadSum += road[index - 1]
            answer += UInt64(roadSum * cur)
            break
        } else {
            roadSum += road[index - 1]
        }
    }
}

print(answer)
