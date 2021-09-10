
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

func sortMethod(_ a: (Int, Int), _ b: (Int, Int)) -> Bool {
    if a.1 != b.1 {
        return a.1 < b.1
    } else {
        return a.0 < b.0
    }
}

var file = FileIO()
let N = file.readInt()
var conference = Array(repeating: (0, 0), count: N)
var answer = 0
var endPoint = 0

for i in 0..<N {
    conference[i] = (file.readInt(), file.readInt())
}

conference.sort(by: sortMethod) 
        
for i in 0..<N {
    if endPoint <= conference[i].0 {
        endPoint = conference[i].1
        answer += 1
    }
}

print(answer)
