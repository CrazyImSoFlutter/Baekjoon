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
let K = file.readInt()
let N = file.readInt()
var LAN = Array(repeating: 0, count: K)
var MAX = 0
var left = 1
var right = 0
var answer = 0

for i in 0..<K {
    LAN[i] = file.readInt()
    MAX = max(MAX, LAN[i])
}

LAN.sort()
right = MAX

while left <= right {
    var count = 0
    let mid = (left + right) / 2

    for i in 0..<K {
        count += LAN[i] / mid
    }
    if count >= N {
        if answer < mid {
            answer = mid
        }
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(answer)



