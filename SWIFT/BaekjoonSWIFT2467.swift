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
var liquid = Array(repeating: 0, count: N)
for i in 0..<N {
    liquid[i] = file.readInt()
}
var left = 0
var right = N - 1
var answer = (0, 0, 2100000000)

while left < right {
    let sum = liquid[left] + liquid[right]
    
    if sum < 0 {
        if abs(sum) < answer.2 {
            answer.0 = liquid[left]
            answer.1 = liquid[right]
            answer.2 = abs(sum)
        }
        left += 1
    } else if sum > 0 {
        if abs(sum) < answer.2 {
            answer.0 = liquid[left]
            answer.1 = liquid[right]
            answer.2 = abs(sum)
        }
        right -= 1
    } else {
        answer.0 = liquid[left]
        answer.1 = liquid[right]
        answer.2 = abs(sum)
        break
    }
}

print(answer.0, answer.1)
