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
liquid.sort()
var answer = (0, 0, 0, 99999999999)

for i in 0..<N {
    var left = i + 1
    var right = N - 1

    while left < right {
        let sum = liquid[i] + liquid[left] + liquid[right]

        if sum < 0 {
            if abs(sum) < answer.3 {
                answer.0 = liquid[i]
                answer.1 = liquid[left]
                answer.2 = liquid[right]
                answer.3 = abs(sum)
            }
            left += 1
        } else if sum > 0 {
            if abs(sum) < answer.3 {
                answer.0 = liquid[i]
                answer.1 = liquid[left]
                answer.2 = liquid[right]
                answer.3 = abs(sum)
            }
            right -= 1
        } else {
            answer.0 = liquid[i]
            answer.1 = liquid[left]
            answer.2 = liquid[right]
            answer.3 = abs(sum)
            break
        }
    }
}
print(answer.0, answer.1, answer.2)
