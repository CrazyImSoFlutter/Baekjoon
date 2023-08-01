import Foundation

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

let file = FileIO()
let N = file.readInt()
var stack = [(Int, Int)]()
var answer = 0
var prevHeight = 0

for _ in 0..<N {
    let height = file.readInt()
    var sameCount = 1
    
    while !stack.isEmpty && stack.last!.0 < height {
        answer += stack.popLast()!.1
    }
    if !stack.isEmpty {
        if stack.last!.0 == height {
            answer += stack.last!.1
            sameCount = stack.last!.1 + 1
            if stack.count > 1 {
                answer += 1
            }
            stack.popLast()
        } else {
            answer += 1
        }
    }
    stack.append((height, sameCount))
}

print(answer)
